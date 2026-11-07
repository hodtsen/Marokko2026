#!/bin/zsh
# Oppdaterer bildegalleriet.
# Leser bildene i bilder/forside og bilder/dag-*, lager nettstørrelser og miniatyrer
# i bilder/_web (originalene røres ikke), og skriver lista til bilder.js.
# HEIC-bilder fra iPhone gjøres om til JPG automatisk (med macOS sitt innebygde verktøy sips).

cd "${0:A:h}" || exit 1
setopt NULL_GLOB EXTENDED_GLOB NO_CASE_GLOB

MAPPER=(forside dag-1 dag-2 dag-3 dag-4 dag-5 dag-6-7)
STOR=2400     # lengste side på bildet som vises stort (piksler)
LITEN=800     # lengste side på miniatyrene

har_sips=0; command -v sips >/dev/null 2>&1 && har_sips=1
ut=bilder.js.tmp
print -r -- "// Laget automatisk av oppdater-bilder.command $(date '+%Y-%m-%d %H:%M'). Ikke rediger for hånd." > $ut
print -r -- "window.BILDER = {" >> $ut

totalt=0
for m in $MAPPER; do
  kilde=bilder/$m; web=bilder/_web/$m
  mkdir -p $kilde $web/thumb
  print -r -- "  \"$m\": [" >> $ut
  n=0
  # sortert etter navn (iPhone/kamera-navn som IMG_1234 blir da i opptaksrekkefølge)
  for f in $kilde/*.(jpg|jpeg|png|heic|heif|webp|tif|tiff)(.on); do
    navn=${f:t:r}.jpg
    stor=$web/$navn; liten=$web/thumb/$navn
    if [[ ! -e $stor || $f -nt $stor ]]; then
      if (( har_sips )); then
        sips -s format jpeg -s formatOptions 85 -Z $STOR  "$f" --out "$stor"  >/dev/null 2>&1
        sips -s format jpeg -s formatOptions 75 -Z $LITEN "$f" --out "$liten" >/dev/null 2>&1
      else
        cp "$f" "$stor"; cp "$f" "$liten"
      fi
    fi
    esc=${navn//\\/\\\\}; esc=${esc//\"/\\\"}
    print -r -- "    \"$esc\"," >> $ut
    (( n++ ))
  done
  print -r -- "  ]," >> $ut
  printf "  %-8s %3d bilder\n" $m $n
  (( totalt += n ))
done
print -r -- "};" >> $ut
mv $ut bilder.js

echo ""
echo "Ferdig: $totalt bilder er lagt inn. Last inn nettsiden på nytt for å se dem."

TOUBKAL 2025 – nettside for turen
=================================

Åpne siden
----------
Dobbeltklikk index.html. Den åpnes i nettleseren din (Safari eller Chrome).
Alt ligger i denne mappa. Internett trengs bare for bakgrunnskartet og skrifttypene.

  index.html      Forsiden: oversikt, dag for dag, overnatting
  kart.html       Kartet med GPS-sporet og høydeprofil
  galleri.html    Filmen og bildene, sortert etter dag


Legge inn bilder
----------------
1. Legg bildene i riktig mappe:
     bilder/forside   – bilder til forsiden. Det FØRSTE bildet (etter filnavn) blir det store toppbildet.
     bilder/dag-1 … bilder/dag-5, bilder/dag-6-7   – bildene fra hver dag
   JPG, PNG og HEIC (iPhone) fungerer. Originalene røres ikke.

2. Dobbeltklikk oppdater-bilder.command.
   Den lager mindre nettversjoner i bilder/_web (raskere sider, og HEIC blir JPG) og oppdaterer bilder.js.
   Første gang kan macOS si at fila ikke kan åpnes: høyreklikk den, velg «Åpne», og bekreft.
   Fungerer ikke dobbeltklikk, åpne Terminal i mappa og skriv:   zsh oppdater-bilder.command

3. Last inn nettsiden på nytt.

Bildene vises i filnavn-rekkefølge. Vil du styre rekkefølgen, gi dem navn som 01.jpg, 02.jpg …


Om filmen
---------
Legg filmen i mappa video/ og gi den navnet film.mp4 eller film.mov.

En 20 GB .mov kan fungere direkte, men det kommer an på formatet inni fila:
  - H.264 / HEVC (vanlig fra iPhone og de fleste kameraer): spilles i Safari. Chrome klarer H.264, ikke alltid HEVC.
  - ProRes (vanlig fra profesjonelle kameraer og eksport fra Final Cut): spilles IKKE i noen nettleser.

Anbefalt: lag en mindre kopi. Den blir typisk 1–4 GB, spiller overalt og spoler raskere.
  - Enklest (innebygd på Mac): åpne filmen i QuickTime Player → Arkiv → Eksporter som → 1080p
    (eller 4K), velg H.264, og lagre som video/film.mov.
  - Alternativ: HandBrake (gratis), forhåndsinnstilling «Fast 1080p30» eller «HQ 1080p30», lagre som video/film.mp4.
Ta vare på originalen et annet sted.


Dele siden med andre
--------------------
GitHub tillater maks 100 MB per fil, og GitHub Pages-sider bør holde seg under 1 GB totalt.
20 GB video passer derfor ikke der. Hvis du vil legge siden ut på nett:
  1. Last opp filmen til YouTube (som «Ikke oppført») eller Vimeo.
  2. Bytt ut <video>-blokken i galleri.html med innbyggingskoden derfra.
  3. Legg resten av mappa på GitHub Pages. Ta bare med bilder/_web, ikke originalbildene.

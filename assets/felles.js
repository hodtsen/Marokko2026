// Felles for alle sider: navigasjon som blir solid ved scrolling, og hjelpefunksjoner for bilder.
window.BILDER = window.BILDER || {};
window.DAGER = [
  {id:'dag-1',  nr:'1',   navn:'Dag 1',   tittel:'Ankomst Marrakesh',        farge:'var(--d1)'},
  {id:'dag-2',  nr:'2',   navn:'Dag 2',   tittel:'Start vandring → Riad Idaisa', farge:'var(--d2)'},
  {id:'dag-3',  nr:'3',   navn:'Dag 3',   tittel:'Opp til Refuge Lepiney',    farge:'var(--d3)'},
  {id:'dag-4',  nr:'4',   navn:'Dag 4',   tittel:'Til Toubkal Base Camp',     farge:'var(--d4)'},
  {id:'dag-5',  nr:'5',   navn:'Dag 5',   tittel:'Toppstøt Jebel Toubkal',    farge:'var(--d5)'},
  {id:'dag-6-7',nr:'6–7', navn:'Dag 6–7', tittel:'Tilbake i Marrakesh',      farge:'var(--d6)'}
];
window.bildeSti = (mappe, fil, thumb) =>
  'bilder/_web/' + encodeURIComponent(mappe) + '/' + (thumb ? 'thumb/' : '') + encodeURIComponent(fil);

(function(){
  const nav = document.querySelector('.nav');
  if(!nav) return;
  const alltidSolid = nav.dataset.solid === 'true';
  const sjekk = () => nav.classList.toggle('solid', alltidSolid || scrollY > 40);
  sjekk(); addEventListener('scroll', sjekk, {passive:true});
})();

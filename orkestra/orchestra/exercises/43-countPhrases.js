function countPhrases(plan){
  if(!plan || !plan.events || !root.Sayac)return plan;
  var groups={}, counter=root.Sayac;
  plan.events.forEach(function(e){
   if(!lead[e.inst] || !isFinite(e.t) || !isFinite(e.midi))return;
   var key=e.inst+':'+Math.floor(e.t/4);(groups[key]||(groups[key]=[])).push(e);
  });
  var n=0;
  Object.keys(groups).forEach(function(key){
   var seq=groups[key].slice(0,8); if(seq.length<2)return;
   var hash=2166136261>>>0, start=seq[0].midi;
   seq.forEach(function(e){hash=Math.imul(hash^((e.midi-start+128)&255),16777619)>>>0;});
   var cell=seq[0].inst+':'+(hash%128), times=counter.get('solo_hucresi',cell);
   // Sayaç, mevcut perde ve süreleri bozmadan hafif ifade çeşidi yönetir.
   var gain=[1,0.96,1.035][times%3];
   seq.forEach(function(e){e.v=+Math.max(0.05,Math.min(1.15,e.v*gain)).toFixed(3);});
   counter.mark('solo_hucresi',cell);n++;
  });
  plan.soloCounterGroups=n;
  try{root.localStorage.setItem('oksl_sayac',counter.dump());}catch(e){}
  return plan;
 }
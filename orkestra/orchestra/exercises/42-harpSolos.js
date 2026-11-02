function harpSolos(plan){
  if(!plan || !plan.events || !plan.movements)return plan;
  var R=rng((plan.seed^0x7552ecb1)>>>0), extra=[], phrases=0;
  var oldHarp=plan.events.filter(function(e){return e.inst==='orchestral_harp';});
  plan.movements.forEach(function(m,mi){
   var bars=m.harmonyGrid||[], used=0, offset=(Math.floor(R()*3)+mi)%4;
   bars.forEach(function(h,bi){
    if(used>=5 || (bi+offset)%4!==0 || !h.notes || h.notes.length<3)return;
    var dur=h.end-h.start;if(dur<0.7)return;
    var start=h.start+dur*0.125, step=dur/8;
    var lastPossible=start+step*4;
    // Mevcut arp sololarıyla üst üste binmemesi için boş bölge tercih edilir.
    if(oldHarp.some(function(e){return e.t<lastPossible+step && e.t+e.d>start-0.12;}))return;
    var ids=patterns.map(function(_,i){return i;});
    var idx=root.Sayac ? root.Sayac.pick(R,'arp_hucresi',ids,function(x){return String(x);}) : Math.floor(R()*patterns.length);
    var pat=patterns[idx], register=64+Math.floor(R()*5), last=register, n=0;
    pat.forEach(function(degree,q){
      var at=start+q*step; if(at+0.08>=h.end || at>=plan.totalSec-(plan.endRing||0))return;
      var tone=h.notes[degree % Math.min(3,h.notes.length)];
      var pc=((Math.round(tone)%12)+12)%12, pitch=warmPitch(pc,last+(q%2===0?2:-1));last=pitch;
      var d=Math.max(0.08,Math.min(step*0.72,h.end-at-0.03,0.28));
      extra.push({inst:'orchestral_harp',midi:pitch,t:+at.toFixed(4),d:+d.toFixed(4),
        v:+(0.19+(q===0?0.03:0)+(R()*0.025)).toFixed(3),px:-0.28,pz:0.25,amp:0.72,cut:0.82,wet:0.70,harpGrain:true});n++;
    });
    if(n){phrases++;used++;}
   });
  });
  Array.prototype.push.apply(plan.events,extra);plan.events.sort(function(a,b){return a.t-b.t});
  plan.notes=plan.events.length;plan.harpGranules={phrases:phrases,notes:extra.length};
  if(plan.kimlik)plan.kimlik.fazGecis+=' · akor sesli arp cümleleri';
  return plan;
 }
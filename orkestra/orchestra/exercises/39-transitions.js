function transitions(p){
  if(!p || !p.events || !p.movements)return p;
  var ev=p.events, moves=p.movements, count=0, details=[];
  for(var i=0;i<moves.length-1;i++){
   var before=moves[i], next=moves[i+1], t=next.start;
   // Çıkış ve giriş arasında ortak perde sınıfları; yoksa perde eklemeden ifade değişir.
   var prev=pcs(ev,Math.max(before.start,t-0.45),t-0.01);
   var incoming=pcs(ev,t,t+0.65), common=[];
   for(var k=0;k<12;k++)if(prev[k] && incoming[k])common.push(k);
   var added=0;
   if(common.length){
    var seed=((p.seed>>>0)^Math.imul(i+1,0x9e3779b1))>>>0;
    var first=common[seed%common.length], second=common[(seed+1)%common.length];
    var inst=i===1?'clarinet':(i===2?'french_horn':'cello');
    var base=inst==='cello'?55:inst==='clarinet'?67:60;
    // İlk ses girişte, ikinci ses ritmik cevap olarak; yalnızca düşük seviyede.
    for(var j=0;j<2;j++){
      var at=t+0.08+j*0.30, dur=0.23;
      if(at+dur>=next.start+next.dur)continue;
      var pitch=closest(j===0?first:second,base+(j?2:0));
      ev.push({inst:inst,midi:pitch,t:+at.toFixed(4),d:dur,v:j===0?0.20:0.17,
        px:inst==='cello'?0.18:-0.16,pz:0.45,amp:0.65,wet:0.7,cut:0.82,transitionCounter:true});
      count++;added++;
    }
   } else {
    // Ortak sınıf yoksa giren bölümün zaten çalan notasına kısa ritmik cevap;
    // yeni bir perde sınıfı getirmez ve kaynak notanın süresini aşmaz.
    var anchors=ev.filter(function(e){return melodic[e.inst] && e.t>=t && e.t<t+0.8 && e.d>=0.30 && e.midi>=48 && e.midi<=84;});
    anchors.sort(function(a,b){return a.t-b.t;});
    if(anchors.length){
      var a=anchors[0], offset=Math.min(0.16,a.d*0.33), len=Math.min(0.18,a.d-offset);
      if(len>=0.06){ev.push({inst:a.inst,midi:a.midi,t:+(a.t+offset).toFixed(4),d:+len.toFixed(4),
        v:0.14,px:isFinite(a.px)?a.px:0,pz:0.45,amp:0.62,wet:0.65,cut:0.78,transitionCounter:true});
        count++;added++;}
    }
   }
   details.push({from:before.name,to:next.name,common:common.length,added:added});
  }
  ev.sort(function(a,b){return a.t-b.t});p.notes=ev.length;p.counterTransitions=details;
  if(p.kimlik)p.kimlik.fazGecis+=' · ortak tonlu karşılık';
  return p;
 }
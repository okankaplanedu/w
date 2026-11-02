function windPhrases(plan){
  if(!plan || !plan.events || !plan.movements)return plan;
  var events=plan.events, additions=[], adjusted=0, splits=0;
  var budget=[0,0,0,0];
  events.forEach(function(e){
   if(!winds[e.inst] || !isFinite(e.midi) || !isFinite(e.t) || !isFinite(e.d))return;
   var mi=-1;
   for(var k=0;k<plan.movements.length;k++)if(e.t>=plan.movements[k].start && e.t<plan.movements[k].start+plan.movements[k].dur){mi=k;break;}
   if(mi<0)return;
   var m=plan.movements[mi], grid=m.beatGrid||[], harmony=m.harmonyGrid||[], h=null;
   for(var j=0;j<harmony.length;j++) if(e.t>=harmony[j].start && e.t<harmony[j].end){h=harmony[j];break;}
   if(!h || !h.notes || !h.notes.length)return;
   var closestBeat=Infinity;
   for(var g=0;g<grid.length;g++){var dd=Math.abs(e.t-grid[g]);if(dd<closestBeat)closestBeat=dd;}
   // Ana vuruştaki solo notayı, en yakın akor sesine bağla; ara notalara dokunma.
   if(closestBeat<0.065){var old=e.midi,newPitch=nearestChord(old,h.notes);
     if(Math.abs(newPitch-old)<=3){e.midi=newPitch;if(old!==newPitch)adjusted++;}}
   // Daha tiz uzun notalarda, kaynak süresi içinde tempo ile ölçülü cümle geliştirme.
   if(e.midi<76 || e.d<0.42 || closestBeat>0.10 || budget[mi]>=24)return;
   var available=Math.min(e.d,h.end-e.t,m.start+m.dur-e.t);
   if(available<0.42)return;
   var parts=e.midi>=84 && available>=0.90 ? 3 : 2;
   var unit=available/parts, original=e.midi;
   var second=nearestChord(original+(e.midi>=84 ? -3 : 2),h.notes);
   if(Math.abs(second-original)>5)second=original;
   e.d=+(unit*0.91).toFixed(4);
   for(var q=1;q<parts;q++){
     var t=e.t+unit*q, n=q%2?second:original;
     var x={inst:e.inst,midi:n,t:+t.toFixed(4),d:+(unit*0.91).toFixed(4),
       v:+Math.max(0.05,Math.min(0.75,e.v*(q===1?0.77:0.70))).toFixed(3),
       px:isFinite(e.px)?e.px:0,pz:isFinite(e.pz)?e.pz:0.35,
       amp:isFinite(e.amp)?Math.min(e.amp,0.85):0.8,cut:isFinite(e.cut)?Math.min(e.cut,0.9):0.85,
       wet:isFinite(e.wet)?e.wet:0.8,windPhrase:true};
     additions.push(x);budget[mi]++;splits++;
   }
  });
  Array.prototype.push.apply(events,additions);events.sort(function(a,b){return a.t-b.t;});
  plan.notes=events.length;plan.windPhrases={aligned:adjusted,extraNotes:splits};
  if(plan.kimlik)plan.kimlik.fazGecis+=' · akora bağlı nefesli cümle';
  return plan;
 }
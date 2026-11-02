function chordTone(target,chord,last){
   var choices=[];
   chord.forEach(function(v){for(var o=-3;o<=3;o++){var m=v+12*o;if(m>=40 && m<=96 && Math.abs(m-target)<=6 && choices.indexOf(m)<0)choices.push(m);}});
   if(!choices.length)return target;
   choices.sort(function(a,b){
     var ap=Math.abs(a-target)+(last===a?2:0),bp=Math.abs(b-target)+(last===b?2:0);return ap-bp;
   });
   return choices[0];
 }
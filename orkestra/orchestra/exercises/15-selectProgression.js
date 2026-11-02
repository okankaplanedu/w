function selectProgression(seed){
    var candidates=[], R=rng((seed^0x95102731)>>>0);
    for(var i=0;i<12;i++)candidates.push(makeProgression((seed+Math.imul(i+1,0x9e3779b1))>>>0));
    if(root.Store && root.Store.PROGRESSIONS) for(var j=0;j<4;j++)candidates.push(root.Store.PROGRESSIONS[Math.floor(R()*root.Store.PROGRESSIONS.length)]);
    var best=candidates[0], bestScore=Infinity;
    candidates.forEach(function(c){
      var worst=0;progressionHistory.forEach(function(h){worst=Math.max(worst,progressionDistance(c,h));});
      var usage=0;
      if(root.Sayac) for(var z=1;z<c.length;z++) usage+=root.Sayac.get('akor_gecis',c[z-1]+'>'+c[z]);
      var score=worst + 0.12*(usage/(usage+60));
      if(score<bestScore){bestScore=score;best=c;}
    });
    var selected=best.slice();
    if(root.Sayac){root.Sayac.mark('akor_dizisi',selected.join('-'));
      selected.forEach(function(ch,i){root.Sayac.mark('akor',ch);if(i)root.Sayac.mark('akor_gecis',selected[i-1]+'>'+ch);});}
    progressionHistory.push(selected);if(progressionHistory.length>48)progressionHistory.shift();
    try {root.localStorage.setItem('oksl.progressions.v2',JSON.stringify(progressionHistory));}catch(e){}
    return selected;
  }
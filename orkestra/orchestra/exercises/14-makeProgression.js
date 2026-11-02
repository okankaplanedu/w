function makeProgression(seed) {
    var R = rng((seed ^ 0x4A39B70D) >>> 0);
    var graph = {
      Am: [['Dm',3],['F',3],['C',2],['G',2],['Em',1]],
      Dm: [['G',3],['E',3],['F',2],['Am',1]],
      F:  [['Dm',2],['G',3],['C',2],['E',2],['Am',1]],
      C:  [['Dm',3],['F',2],['G',3],['Em',1]],
      G:  [['Am',3],['C',2],['F',2],['Em',1]],
      Em: [['F',3],['Dm',2],['Am',2],['G',1]],
      E:  [['Am',8]]
    };
    var out=['Am'];
    while(out.length<16) {
      var pos=out.length;
      if(pos===7 || pos===15) { out.push('E'); continue; }
      if(pos===8) { out.push('Am'); continue; }
      var prev=out[out.length-1], choices=graph[prev] || graph.Am;
      var weights=choices.map(function(c){
        var w=c[1];
        if((pos===6 || pos===14) && c[0]==='E') w=0;
        if(c[0]===out[out.length-2]) w*=0.20;
        if(c[0]===out[out.length-3]) w*=0.50;
        if(pos>=5 && pos<7 && (c[0]==='Dm'||c[0]==='F')) w*=1.5;
        return w;
      });
      var total=weights.reduce(function(a,b){return a+b;},0), pickValue=R()*total, chosen=choices[0][0];
      for(var i=0;i<choices.length;i++){ pickValue-=weights[i]; if(pickValue<0){chosen=choices[i][0];break;} }
      out.push(chosen);
    }
    return out;
  }
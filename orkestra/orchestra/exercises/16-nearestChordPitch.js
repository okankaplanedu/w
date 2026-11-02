function nearestChordPitch(note, chord) {
    var best=note, distance=99;
    chord.forEach(function(c){ for(var o=-3;o<=3;o++){var v=c+o*12, d=Math.abs(v-note);if(d<distance){distance=d;best=v;}} });
    return Math.max(24,Math.min(100,best));
  }
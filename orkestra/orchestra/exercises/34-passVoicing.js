function passVoicing(ev, stats) {
    var bins = {};
    for (var i = 0; i < ev.length; i++) {
      var e = ev[i];
      if (!CHORDISH[e.inst]) continue;
      var k = Math.round(e.t * 20);
      (bins[k] || (bins[k] = [])).push(e);
    }
    for (var k2 in bins) {
      var g = bins[k2];
      if (g.length < 3 || g.length > 6) continue;
      g.sort(function (x, y) { return x.midi - y.midi; });
      for (var j = 0; j < g.length; j++) {
        var f = j === 0 ? 1.03 : j === 1 ? 0.90 : j === 2 ? 0.86 : 0.82;
        g[j].amp = +clamp((g[j].amp || 1) * f, 0.4, 1.6).toFixed(3);
        stats.voiced++;
      }
    }
  }
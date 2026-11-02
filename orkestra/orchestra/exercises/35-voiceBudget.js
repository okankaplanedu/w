function voiceBudget(ev, stats) {
    var bins = {};
    for (var i = 0; i < ev.length; i++) {
      var e = ev[i];
      var k = Math.floor(e.t * 4);
      (bins[k] || (bins[k] = [])).push(e);
    }
    for (var k2 in bins) {
      var g = bins[k2];
      if (g.length <= 42) continue;
      g.sort(function (a, b) { return a.v * (a.amp || 1) - b.v * (b.amp || 1); });
      var n = Math.ceil(g.length * 0.3);
      for (var j = 0; j < n; j++) {
        if (PERC[g[j].inst]) continue;
        g[j].amp = +clamp((g[j].amp || 1) * 0.75, 0.45, 1.55).toFixed(3);
        stats.budgetTrims++;
      }
    }
  }
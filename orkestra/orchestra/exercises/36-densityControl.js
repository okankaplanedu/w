function densityControl(ev, stats) {
    var bins = {};
    for (var i = 0; i < ev.length; i++) {
      var e = ev[i];
      var k = Math.floor(e.t * 8);                       // 0.125 sn
      (bins[k] || (bins[k] = [])).push(e);
    }
    var keep = {};
    for (var k2 in bins) {
      var g = bins[k2];
      if (g.length <= 14) continue;
      g.sort(function (a, b) {
        var ia = a.v * (a.amp || 1) * (SOLO[a.inst] ? 1.3 : 1) * (PERC[a.inst] ? 1.12 : 1);
        var ib = b.v * (b.amp || 1) * (SOLO[b.inst] ? 1.3 : 1) * (PERC[b.inst] ? 1.12 : 1);
        return ib - ia;
      });
      for (var j = 14; j < g.length; j++) {
        var e2 = g[j];
        if (SOLO[e2.inst] || PERC[e2.inst]) continue;
        if (e2.v * (e2.amp || 1) > 0.5) continue;        // güçlü sesi asla silme
        e2._drop = 1;
        stats.densityDrops++;
      }
    }
    return ev.filter(function (e) { return !e._drop; });
  }
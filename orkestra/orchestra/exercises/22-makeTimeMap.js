function makeTimeMap(baseBar, winStartBar, N, bpmList, outStart) {
    /* yarı ölçü kırılımları: eğri yumuşar, tempo "sıcak" akar */
    var pts = [], cum = outStart, H = 2 * N;
    for (var h = 0; h <= H; h++) {
      var x = h * 0.5;
      var baseT = (winStartBar + x) * baseBar;
      if (h > 0) {
        var bpm = bpmAtList(bpmList, x - 0.25);
        if (!(bpm > 20)) bpm = 120;
        cum += (240 / bpm) / 2;
      }
      pts.push({ b: baseT, c: cum });
    }
    var endT = pts[pts.length - 1].c;
    return {
      pts: pts,
      to: function (baseT) {
        if (!(baseT > pts[0].b)) return pts[0].c;
        if (baseT >= pts[pts.length - 1].b) return endT;
        var lo = 0, hi = pts.length - 1;
        while (hi - lo > 1) { var mid = (lo + hi) >> 1; if (pts[mid].b <= baseT) lo = mid; else hi = mid; }
        var p1 = pts[lo], p2 = pts[hi];
        var k = (baseT - p1.b) / Math.max(1e-9, p2.b - p1.b);
        return p1.c + (p2.c - p1.c) * k;
      },
      rate: function (baseT) {
        var lo = 0, hi = pts.length - 1;
        if (baseT <= pts[0].b) baseT = pts[0].b + 1e-6;
        if (baseT >= pts[pts.length - 1].b) baseT = pts[pts.length - 1].b - 1e-6;
        while (hi - lo > 1) { var mid2 = (lo + hi) >> 1; if (pts[mid2].b <= baseT) lo = mid2; else hi = mid2; }
        var q1 = pts[lo], q2 = pts[hi];
        return (q2.c - q1.c) / Math.max(1e-9, q2.b - q1.b);
      }
    };
  }
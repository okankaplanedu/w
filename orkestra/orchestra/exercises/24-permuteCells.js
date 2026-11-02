function permuteCells(ev, R, vy) {
    var pCell = vy ? vy.cellRotate : 0.55;
    var pSeq = vy ? vy.seqRotate : 0.28;
    var pSwap = vy ? vy.seqSwap : 0.35;
    /* (1) aynı anda çalan akor hücreleri: perde sırası döndürülür */
    var groups = {};
    for (var i = 0; i < ev.length; i++) {
      var e = ev[i];
      if (!CHORD_SET[e.inst]) continue;
      var key = Math.round(e.t * 1000);
      (groups[key] || (groups[key] = [])).push(e);
    }
    for (var k in groups) {
      var g = groups[k];
      if (g.length < 2 || g.length > 6) continue;
      if (R() > pCell) continue;
      var mids = g.map(function (x) { return x.midi; });
      var uniq = {}; mids.forEach(function (m) { uniq[m] = 1; });
      if (Object.keys(uniq).length < 2) continue;
      var rot = 1 + Math.floor(R() * (g.length - 1));
      for (var j = 0; j < g.length; j++) g[j].midi = mids[(j + rot) % g.length];
    }
    /* (2) ölçü içindeki solo diziler: sıra rastgele döndürülür/değiştirilir */
    var bars = {};
    for (var i2 = 0; i2 < ev.length; i2++) {
      var e2 = ev[i2];
      if (!LEAD_SET[e2.inst] || e2.d < 0.12) continue;
      var b = Math.floor(e2.t / 2);
      var key2 = e2.inst + ':' + b;
      (bars[key2] || (bars[key2] = [])).push(e2);
    }
    for (var k2 in bars) {
      var seq = bars[k2];
      if (seq.length < 3 || seq.length > 14) continue;
      seq.sort(function (a, b2) { return a.t - b2.t; });
      if (R() < pSeq) {
        var m2 = seq.map(function (x) { return x.midi; });
        var rot2 = 1 + Math.floor(R() * (seq.length - 1));
        for (var j2 = 0; j2 < seq.length; j2++) seq[j2].midi = m2[(j2 + rot2) % seq.length];
      } else if (R() < pSwap) {
        var a1 = Math.floor(R() * (seq.length - 1));
        var tmp = seq[a1].midi; seq[a1].midi = seq[a1 + 1].midi; seq[a1 + 1].midi = tmp;
      }
    }
    /* (3) hücre ritmi: akor hücrelerinde nefes/doluluk varyasyonu (maksimum hücre örüntüsü) */
    var cellDens = vy ? vy.cellDens : 1;
    for (var i3 = 0; i3 < ev.length; i3++) {
      var e3 = ev[i3];
      if (!CHORD_SET[e3.inst] || e3.d < 0.1) continue;
      if (R() < 0.22) e3.d = +Math.max(0.08, e3.d * cellDens * (0.85 + R() * 0.3)).toFixed(4);
    }
    /* (4) PROGRESYON TAKASI: ölçü blokları (tüm içeriğiyle) yer değiştirir
       — akor ilerleyişi her konserde farklı kurulur; blok içi uyum korunur */
    var pProg = vy ? vy.progSwap : 0.3;
    var bucket = {};
    for (var i4 = 0; i4 < ev.length; i4++) {
      var e4 = ev[i4];
      var bkey = Math.floor(e4.t / 2);
      (bucket[bkey] || (bucket[bkey] = [])).push(e4);
    }
    var bkeys = Object.keys(bucket).map(Number).sort(function (a, b) { return a - b; });
    if (bkeys.length >= 6) {
      var swaps = 1 + Math.floor(R() * 3);
      for (var sw = 0; sw < swaps; sw++) {
        var ia = 1 + Math.floor(R() * (bkeys.length - 2));
        var ib = 1 + Math.floor(R() * (bkeys.length - 2));
        if (ia === ib || R() > pProg) continue;
        var A = bucket[bkeys[ia]], B = bucket[bkeys[ib]];
        if (!A || !B) continue;
        var tA = bkeys[ia] * 2, tB = bkeys[ib] * 2;
        for (var q = 0; q < A.length; q++) A[q].t = +(tB + (A[q].t - tA)).toFixed(4);
        for (var q2 = 0; q2 < B.length; q2++) B[q2].t = +(tA + (B[q2].t - tB)).toFixed(4);
      }
    }
    return ev;
  }
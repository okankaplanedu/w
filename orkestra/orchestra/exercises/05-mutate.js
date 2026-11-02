function mutate(motif, p, seed) {
    var R = rng(seed || 777);
    p = Math.max(0.05, Math.min(0.20, p == null ? 0.12 : p));
    return motif.map(function (n) {
      var m = { deg: n.deg, midi: n.midi, dur: n.dur };
      if (R() < p) {                                        // perde mutasyonu (±1 derece)
        var d = (R() < 0.5 ? -1 : 1) * (R() < 0.8 ? 1 : 2);
        var nd = ((m.deg + d) % 8 + 8) % 8;
        m.deg = nd; m.midi = n.midi + (SCALE[nd] - SCALE[n.deg]);
      }
      if (R() < p * 0.8) {                                  // süre mutasyonu
        var w = R() < 0.5 ? PHI : 1 / PHI;
        m.dur = Math.max(0.25, Math.min(3, m.dur * w));
      }
      return m;
    });
  }
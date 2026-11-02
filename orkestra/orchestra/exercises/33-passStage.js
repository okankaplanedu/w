function passStage(ev, R, stats, vy) {
    var keskin = MIX.sep !== 'dogal';
    var panScale = (vy && vy.panScale) || 1;          // VARYA: 3B sahne genişliği (konser başına)
    for (var i = 0; i < ev.length; i++) {
      var e = ev[i];
      var u = MIX.unitOf(e.inst);
      var jit = (R() - 0.5) * 0.07;                      // organik mikro genişlik
      var px, pz, cut, wet, amp;
      if (keskin) {
        px = (u.px + jit) * panScale;
        pz = u.pz + Math.abs((R() - 0.5) * 0.10);
        cut = u.cut * (0.97 + R() * 0.06);
        wet = u.wet * (0.96 + R() * 0.08);
        amp = u.amp;
      } else {
        /* doğal: savaş sahnesiyle harmanlanmış (kontrast yarıda) */
        px = ((e.px != null ? e.px : 0) * 0.5 + (u.px + jit) * 0.5) * panScale;
        pz = (Math.abs(e.pz || 0) * 0.5 + u.pz * 0.5);
        cut = 1 + (u.cut - 1) * 0.55;
        wet = 1 + (u.wet - 1) * 0.55;
        amp = 1 + (u.amp - 1) * 0.55;
      }
      e.px = +clamp(px, -0.95, 0.95).toFixed(3);
      e.pz = +clamp(pz, 0.05, 2.2).toFixed(3);
      e.cut = +clamp(cut, 0.55, 1.5).toFixed(3);
      e.wet = +clamp(wet, 0.55, 1.6).toFixed(3);
      e.amp = +clamp(amp, 0.4, 1.6).toFixed(3);
      e.unit = u.id;
      stats.staged++;
    }
  }
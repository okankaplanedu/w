function passStereo(ev) {
    var mode = KQ.MODES[KQ.mode] || KQ.MODES.kulaklik;
    for (var i = 0; i < ev.length; i++) {
      var e = ev[i];
      if (e.px == null) e.px = 0;
      if (e.pz == null) e.pz = 0;
      /* bas merkezleme: alçak frekanslar ortada (hoparlör fizikleri) */
      if (BASS_FAM[e.inst]) {
        e.px = +clamp(e.px, -0.25, 0.25).toFixed(3);
        e.pz = +(e.pz * 0.6).toFixed(3);
      }
      /* izleme modu imaj yönetimi */
      e.px = +(clamp(e.px * mode.px, -0.95, 0.95)).toFixed(3);
      e.pz = +(clamp(e.pz * mode.pz, -2.8, 2.8)).toFixed(3);
    }
  }
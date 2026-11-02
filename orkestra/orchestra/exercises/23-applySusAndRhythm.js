function applySusAndRhythm(ev, sc, s, N, R, profile, barSec) {
    var susBars = {};
    /* skorun kendi ateşkes/sus pencereleri korunur */
    if (sc.ceasefire && sc.ceasefire.detail) {
      sc.ceasefire.detail.forEach(function (d) {
        for (var q = d.start; q < d.start + d.len; q++) {
          var local = q - s;
          if (local >= 0 && local < N) susBars[local] = 1;
        }
      });
    }
    /* ek "nefes" ölçüleri: karışıklığa yer bırak (tümsekler çukurlar) */
    var extra = [];
    var tries = 0;
    while (extra.length < 2 && tries++ < 40) {
      var b = 2 + Math.floor(R() * Math.max(1, N - 5));
      if (susBars[b] || extra.indexOf(b) >= 0) continue;
      extra.push(b); susBars[b] = 2;      // 2 = bizim nefesimiz
    }
    /* ritm varyasyonu: 2 ölçüde 3.5. vuruşta kısa soluk (vurmalara dokunma) */
    var gapBars = {};
    tries = 0;
    while (Object.keys(gapBars).length < 2 && tries++ < 40) {
      var g = 1 + Math.floor(R() * Math.max(1, N - 2));
      if (susBars[g]) continue;
      gapBars[g] = 1;
    }
    var beat = barSec / 4;
    var kept = [];
    for (var i = 0; i < ev.length; i++) {
      var e = ev[i];
      var bIdx = Math.floor(e.t / barSec + 1e-6);
      if (susBars[bIdx]) {
        if (!SOLO_OK[e.inst]) continue;           // sus: orkestra el çeker
        e.v = +(e.v * 0.85).toFixed(3);
      } else if (gapBars[bIdx]) {
        var off = e.t - bIdx * barSec;
        if (!PERC_LOCK[e.inst] && !LEAD_SET[e.inst] && off >= beat * 3.25 && off < beat * 3.75) continue;
      }
      /* insani mikro kayma (vurmalı ızgarasına dokunma) */
      if (!PERC_LOCK[e.inst]) {
        var jit = (R() - 0.5) * (LEAD_SET[e.inst] ? 0.028 : 0.014);
        e.t = +Math.max(0, e.t + jit).toFixed(4);
      }
      /* ritmik nefes: solo seslerde süre titreşimi */
      if (LEAD_SET[e.inst] && R() < 0.3) e.d = +Math.max(0.05, e.d * (0.9 + R() * 0.28)).toFixed(4);
      kept.push(e);
    }
    /* nefes ölçüleri için sıcak solo notalar (sıcak etkileşim) */
    extra.forEach(function (b) {
      var t0 = b * barSec + beat * (R() < 0.5 ? 0 : 2);
      kept.push({
        inst: profile.echoInst, midi: pick(R, [69, 72, 76, 74, 72, 69]),
        t: +t0.toFixed(4), d: +(beat * 1.6).toFixed(4), v: 0.5, px: 0.18, pz: -0.6
      });
    });
    return kept;
  }
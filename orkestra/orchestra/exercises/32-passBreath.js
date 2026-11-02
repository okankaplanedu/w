function passBreath(ev) {
    var ph = (ev.length % 7) * 0.9;
    for (var i = 0; i < ev.length; i++) {
      var e = ev[i];
      if (PERC[e.inst]) continue;
      var g = 1 - 0.06 * (0.5 + 0.5 * Math.sin((e.t / 23) * Math.PI * 2 + ph));
      e.v = +clamp(e.v * g, 0.05, 1.35).toFixed(3);
    }
  }
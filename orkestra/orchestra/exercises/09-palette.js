function palette(R) {
    var base = { str: 1, brass: 1, perc: 1, wood: 0.9, choir: 0.6, bell: 0.3 };
    var keys = ['str', 'brass', 'perc', 'wood', 'choir', 'bell'];
    var hi = pick(R, keys), lo = pick(R, keys.filter(function (k) { return k !== hi; }));
    base[hi] = 1.35 + R() * 0.3;
    base[lo] = 0.35 + R() * 0.25;
    keys.forEach(function (k) {
      if (k !== hi && k !== lo) base[k] = 0.75 + R() * 0.6;
    });
    return { w: base, hi: hi, lo: lo, hiW: base[hi], loW: base[lo] };
  }
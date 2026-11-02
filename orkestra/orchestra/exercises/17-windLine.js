function windLine(chord, R, reg) {
    var set = chord.concat([chord[0] + 12, chord[2] - 12]);
    var n = 3 + Math.floor(R() * 3);
    var out = [], idx = Math.floor(R() * set.length);
    for (var i = 0; i < n; i++) {
      out.push(set[idx % set.length] + (reg || 12));
      idx += (R() < 0.55 ? 1 : -1) * (1 + Math.floor(R() * 2));
      if (idx < 0) idx = set.length - 1;
    }
    return out;
  }
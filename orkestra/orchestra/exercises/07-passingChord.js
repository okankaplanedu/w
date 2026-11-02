function passingChord(a, b, R) {
    /* iki akor arasına geçiş akoru: ortak tonlar + yarım adım yaklaşım */
    var mid = a.map(function (pc, i) { return Math.round((pc + b[i]) / 2); });
    if (R() < 0.5) mid[0] -= 1;                              // yeden (leading tone) etkisi
    return mid;
  }
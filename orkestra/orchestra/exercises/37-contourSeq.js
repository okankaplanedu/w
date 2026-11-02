function contourSeq(R, shape, n, d0) {
    var out = [], d = d0;
    for (var i = 0; i < n; i++) {
      out.push(d);
      if (shape === 'rise') d += R() < 0.72 ? 1 : (R() < 0.5 ? 2 : -1);
      else if (shape === 'fall') d += R() < 0.72 ? -1 : (R() < 0.5 ? -2 : 1);
      else if (shape === 'wave') {
        var ph = Math.sin((i / Math.max(1, n - 1)) * Math.PI * 2 - Math.PI / 2);
        d += ph > 0.2 ? (R() < 0.7 ? 1 : 2) : (R() < 0.7 ? -1 : -2);
      } else if (shape === 'zigzag') {
        d += (i % 2 === 0) ? (1 + Math.floor(R() * 2)) : -(1 + Math.floor(R() * 2));
      } else { /* plateau */
        d += R() < 0.58 ? 0 : (R() < 0.5 ? 1 : -1);
      }
      d = clamp(d, -2, 14);
    }
    return out;
  }
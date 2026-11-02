function invert(chord, inv) {
    var shape = INV[((inv % 3) + 3) % 3];
    var root = chord[0];
    return shape.map(function (iv) {
      /* akorun kendi tonlarına en yakın yerleşim */
      var target = root + iv;
      var best = chord[0], bd = 99;
      chord.forEach(function (pc) {
        for (var o = -12; o <= 24; o += 12) {
          var cand = pc + o, d = Math.abs(cand - target);
          if (d < bd) { bd = d; best = cand; }
        }
      });
      return best;
    }).sort(function (a, b) { return a - b; });
  }
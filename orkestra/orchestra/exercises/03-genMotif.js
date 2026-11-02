function genMotif(opts) {
    opts = opts || {};
    var R = rng(opts.seed || 12345);
    var rows = opts.matrix || buildMatrix(opts.push);
    var len = opts.len || 8 + Math.floor(R() * 5);          // 8–12 olay
    var root = opts.root == null ? 57 : opts.root;          // La3
    var minBeat = opts.minBeat || 0.5, maxBeat = opts.maxBeat || 2;
    var out = [];
    var st = opts.start != null ? opts.start : 0;           // tonikten başla
    for (var i = 0; i < len; i++) {
      var deg = ((st % 8) + 8) % 8;
      var midi = root + SCALE[deg] + (st >= 8 ? 12 : 0);
      out.push({ deg: deg, midi: midi, dur: fibDur(R, minBeat, maxBeat) });
      st = nextState(rows[deg], R);
      /* kadans eğilimi: motif sonuna doğru tonik/beşliye çek */
      if (i === len - 2 && R() < 0.6) st = 4;               // beşli
      if (i === len - 1) st = 0;
    }
    return out;
  }
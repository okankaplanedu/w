function buildMatrix(push) {
    /* P[i][j] : i derecesinden j derecesine geçiş ağırlığı */
    var base = [
      /*0 */ [0, 22, 10, 6, 14, 4, 8, 2],
      /*1 */ [16, 0, 20, 12, 6, 2, 4, 1],
      /*2 */ [10, 18, 0, 22, 8, 2, 3, 1],
      /*3 */ [6, 10, 18, 0, 20, 6, 4, 2],
      /*4 */ [18, 4, 8, 16, 0, 10, 6, 2],
      /*5 */ [10, 4, 4, 12, 16, 0, 12, 2],
      /*6 */ [12, 4, 6, 6, 12, 12, 0, 8],
      /*7 */ [20, 2, 4, 4, 10, 4, 10, 0]
    ];
    var p = push == null ? 0.12 : push;               // sürpriz sıçrama oranı
    var R = rng(0xC0FFEE ^ Math.floor(p * 1000));
    return base.map(function (row) {
      var r = row.map(function (w) { return Math.max(0.01, w + (R() - 0.5) * 4); });
      /* uzak derecelere (>=4 adım) düşük olasılık → tür kimliği korunur */
      for (var j = 0; j < r.length; j++) if (Math.abs(j - r.indexOf(row[0])) >= 4) r[j] *= (0.4 + p);
      var sum = r.reduce(function (a, b) { return a + b; }, 0);
      return r.map(function (w) { return w / sum; });
    });
  }
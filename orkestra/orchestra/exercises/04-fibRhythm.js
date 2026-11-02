function fibRhythm(R, beats, detail) {
    /* beats: toplam vuruş (örn. 4). detail: 0..1 alt bölme yoğunluğu */
    var onsets = [], t = 0, guard = 0;
    var step = [2, 3, 3, 5, 5, 8][Math.floor(R() * 6)] / 4;   // 0.5 … 2 vuruş
    while (t < beats - 1e-6 && guard++ < 64) {
      onsets.push(+t.toFixed(3));
      var a = step;
      var b = a / PHI;
      var pickA = R() < (0.5 + (detail || 0) * 0.35);
      t += (pickA ? a : b) * (R() < 0.2 ? PHI : 1);
      if (t > beats) break;
    }
    /* altın kesit vurgusu: 0.618 noktasına bir vuruş ekle */
    var pivot = +(beats * 0.618).toFixed(3);
    if (pivot < beats && onsets.indexOf(pivot) < 0) onsets.push(pivot);
    onsets.sort(function (x, y) { return x - y; });
    var out = [];
    for (var i = 0; i < onsets.length; i++) {
      var d = (i + 1 < onsets.length ? onsets[i + 1] : beats) - onsets[i];
      out.push({ t: onsets[i], d: Math.max(0.08, d * 0.96) });
    }
    return out;
  }
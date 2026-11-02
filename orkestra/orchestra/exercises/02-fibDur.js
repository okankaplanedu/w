function fibDur(R, minBeat, maxBeat) {
    var pool = FIB.filter(function (f) { return f >= minBeat * 4 && f <= maxBeat * 4; });
    if (!pool.length) pool = [1, 2, 3];
    var f = pool[Math.floor(R() * pool.length)];
    /* altın oran esnetmesi: süre × φ^0 ya da φ^-1 → doğal ama mekanik olmayan */
    var warp = R() < 0.28 ? (R() < 0.5 ? PHI : 1 / PHI) : 1;
    return Math.max(minBeat, Math.min(maxBeat, (f / 4) * warp));
  }
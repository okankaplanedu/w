function makeIR(dur, decay) {
    var sr = ctx.sampleRate, len = Math.max(1, Math.floor(sr * dur));
    var buf = ctx.createBuffer(2, len, sr);
    var pre = Math.floor(sr * 0.022);
    for (var ch = 0; ch < 2; ch++) {
      var d = buf.getChannelData(ch);
      for (var i = 0; i < len; i++) {
        if (i < pre) { d[i] = 0; continue; }
        var t = (i - pre) / (len - pre);
        d[i] = (Math.random() * 2 - 1) * Math.pow(1 - t, decay) * (1 - t * 0.2);
      }
    }
    return buf;
  }
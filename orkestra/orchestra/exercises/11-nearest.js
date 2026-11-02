function nearest(inst, midi) {
    var arr = buffers[inst];
    if (!arr || !arr.length) return null;
    var best = arr[0], bd = 999;
    for (var i = 0; i < arr.length; i++) {
      var d = Math.abs(arr[i].midi - midi);
      if (d < bd) { bd = d; best = arr[i]; }
    }
    return best;
  }
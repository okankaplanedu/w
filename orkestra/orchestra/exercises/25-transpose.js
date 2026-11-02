function transpose(ev, semis) {
    var out = [];
    for (var i = 0; i < ev.length; i++) {
      var e = ev[i];
      if (semis && !NO_TRANS[e.inst]) e.midi = e.midi + semis;
      /* motor aralığı (ORC.note: 14..118) — dışarıdakiler sessizce atılır */
      if (!(e.midi >= 14 && e.midi <= 118)) continue;
      out.push(e);
    }
    return out;
  }
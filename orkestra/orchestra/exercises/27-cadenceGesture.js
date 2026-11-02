function cadenceGesture(style, t0, beat, R, isFinal) {
    var ev = [];
    function p(inst, midi, t, d, v, px, pz) {
      ev.push({ inst: inst, midi: midi, t: +t.toFixed(4), d: +d.toFixed(4), v: +clamp(v, 0.05, 1.35).toFixed(3), px: px || 0, pz: pz || 0 });
    }
    var T = t0;
    var long = isFinal ? beat * 4.5 : beat * 2;
    if (style === 'zafer') {
      /* V → I: önce E, sonra Am (tam kadans, tutti) */
      CH.E.forEach(function (m) { p('brass_section', m, T, beat * 1.2, 0.85); });
      p('timpani', 40, T, 0.3, 1.0);
      CH.Am.forEach(function (m) { p('brass_section', m + 12, T + beat * 1.5, long, 0.9); p('french_horn', m, T + beat * 1.5, long, 0.7); });
      p('string_ensemble_1', 57, T + beat * 1.5, long, 0.6); p('string_ensemble_1', 69, T + beat * 1.5, long, 0.5);
      p('timpani', 45, T + beat * 1.5, 0.4, 1.05); p('taiko_drum', 43, T + beat * 1.5, 0.2, 0.8);
      p('tubular_bells', 69, T + beat * 1.5, long, 0.5);
    } else if (style === 'plagal') {
      /* IV → I: sıcak, yaylı */
      CH.Dm.forEach(function (m) { p('string_ensemble_1', m, T, beat * 1.4, 0.5); });
      CH.Am.forEach(function (m) { p('string_ensemble_1', m, T + beat * 1.5, long, 0.55); p('choir_aahs', m + 12, T + beat * 1.5, long, 0.35); });
      p('orchestral_harp', 57, T + beat * 1.5, long * 0.8, 0.4);
    } else if (style === 'yalvarma') {
      [72, 71, 69].forEach(function (m, j) { p('oboe', m, T + j * beat * 0.75, beat * 0.7, 0.5 - j * 0.05, -0.12, -1.4); });
      CH.Am.forEach(function (m) { p('voice_oohs', m, T + beat * 2.2, long, 0.3); });
    } else if (style === 'sessizAmin') {
      CH.Am.forEach(function (m) { p('choir_aahs', m, T, long * 1.2, 0.32); p('voice_oohs', m + 12, T + beat * 0.5, long, 0.24); });
      p('tubular_bells', 57, T, long, 0.3);
    } else if (style === 'hemiola') {
      /* 3-3-2 vurgu: ritmik kadans */
      [[0, 69], [beat * 1.5, 64], [beat * 3, 57]].forEach(function (q, j) {
        p('brass_section', q[1], T + q[0], beat * 0.8, 0.8 - j * 0.05);
        p('timpani', j === 2 ? 45 : 40, T + q[0], 0.22, 0.85);
      });
      CH.Am.forEach(function (m) { p('brass_section', m, T + beat * 4, long, 0.7); });
    } else if (style === 'parlak') {
      var run = [69, 72, 76, 81, 84, 88];
      run.forEach(function (m, j) { p('glockenspiel', m, T + j * beat * 0.25, beat * 0.4, 0.5 + j * 0.05); });
      CH.Am.forEach(function (m) { p('string_ensemble_1', m + 12, T + beat * 1.6, long, 0.55); });
      p('tubular_bells', 81, T + beat * 1.6, long, 0.55); p('tubular_bells', 69, T + beat * 1.6, long, 0.45);
      p('reverse_cymbal', 60, T, beat * 1.5, 0.5);
    } else { /* donus: E7 akoru ile devriyeye hazırlık */
      [52, 56, 59, 65].forEach(function (m, j) { p('french_horn', m, T + j * beat * 0.35, beat * 1.2, 0.45); });
      p('timpani', 40, T + beat * 1.8, 0.25, 0.6);
    }
    if (isFinal) {
      /* BÜYÜK FİNAL: uzun La minör + çan + ters zil (her profile eklenir) */
      CH.Am.forEach(function (m) {
        p('brass_section', m, T + beat * 2, beat * 4, 0.8);
        p('string_ensemble_1', m + 12, T + beat * 2, beat * 4, 0.5);
      });
      p('tubular_bells', 81, T + beat * 2, beat * 4, 0.5);
      p('reverse_cymbal', 60, T + beat * 1.2, beat * 1.2, 0.55);
      p('timpani', 45, T + beat * 2, 0.5, 1.0);
    }
    return ev;
  }
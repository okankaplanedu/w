function introGesture(style, t0, beat, R) {
    var ev = [];
    function p(inst, midi, t, d, v, px, pz) {
      ev.push({ inst: inst, midi: midi, t: +t.toFixed(4), d: +d.toFixed(4), v: +clamp(v, 0.05, 1.35).toFixed(3), px: px || 0, pz: pz || 0 });
    }
    var T = t0;
    if (style === 'fanfar') {
      p('timpani', 45, T, 0.25, 1.0); p('timpani', 45, T + beat * 0.5, 0.25, 0.8);
      p('trumpet', 69, T + beat, beat * 0.9, 0.85); p('trumpet', 76, T + beat * 2, beat * 0.9, 0.9);
      p('french_horn', 57, T + beat, beat * 1.8, 0.6); p('brass_section', 57, T + beat * 2, beat * 1.6, 0.55);
    } else if (style === 'timpRulo') {
      for (var i = 0; i < 8; i++) p('timpani', 45, T + i * beat * 0.25, 0.16, 0.35 + i * 0.09);
      p('string_ensemble_1', 57, T, beat * 2, 0.35); p('string_ensemble_1', 64, T, beat * 2, 0.30);
      p('orchestra_hit', 57, T + beat * 2, 0.3, 0.8);
    } else if (style === 'koroNefes') {
      p('choir_aahs', 57, T, beat * 3, 0.42); p('voice_oohs', 64, T, beat * 3, 0.36);
      p('tubular_bells', 69, T + beat * 1.5, beat * 1.5, 0.35);
    } else if (style === 'harpDizisi') {
      var up = [57, 60, 64, 69, 72, 76, 81];
      up.forEach(function (m, j) { p('orchestral_harp', m, T + j * beat * 0.25, beat * 0.5, 0.45 + j * 0.04); });
      p('string_ensemble_1', 57, T + beat * 1.75, beat * 1.5, 0.3);
    } else if (style === 'marş') {
      p('woodblock', 72, T, 0.08, 0.55); p('woodblock', 72, T + beat * 0.5, 0.08, 0.4);
      p('melodic_tom', 50, T + beat, 0.12, 0.7); p('taiko_drum', 43, T + beat * 2, 0.14, 0.85);
      p('brass_section', 57, T + beat * 2, beat * 1.2, 0.62); p('brass_section', 64, T + beat * 3, beat * 1.2, 0.58);
    } else if (style === 'yildiz') {
      p('reverse_cymbal', 60, T, beat * 2, 0.55);
      var gl = [81, 84, 88, 91, 88, 84];
      gl.forEach(function (m, j) { p('glockenspiel', m, T + beat * 0.5 + j * beat * 0.22, beat * 0.4, 0.4 + j * 0.05); });
      p('orchestral_harp', 57, T + beat * 0.5, beat * 1.5, 0.35);
    } else if (style === 'sessizNefes') {
      p('oboe', 72, T + beat * 0.5, beat * 1.8, 0.4, -0.1, -1.8);
      p('pizzicato_strings', 45, T + beat * 2.5, 0.2, 0.4);
    } else { /* yavasYukselis */
      p('string_ensemble_1', 57, T, beat * 2.5, 0.32); p('string_ensemble_2', 64, T, beat * 2.5, 0.26);
      p('tuba', 33, T, beat * 2.5, 0.5); p('cello', 45, T + beat * 1, beat * 1.5, 0.4);
    }
    return ev;
  }
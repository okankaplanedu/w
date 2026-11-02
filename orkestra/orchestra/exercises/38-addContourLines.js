function addContourLines(plan, R, stats) {
    var movs = plan.movements;
    var USE = { giris: ['A', 'B'], tema: ['A', 'C'], kopru: ['B', 'C'], final: ['A', 'B', 'C', 'D'] };
    movs.forEach(function (m, mi) {
      var beat = 60 / Math.max(40, (m.bpmFrom + m.bpmTo) / 2);
      var rootM = 57 + (m.trans || 0);      // hareketin ton kökü (modül root'ını GÖLGELEME!)
      var hats = USE[m.key] || ['A', 'B'];
      hats.forEach(function (hat, hi) {
        var L = null;
        for (var q = 0; q < LINES.length; q++) if (LINES[q].hat === hat) L = LINES[q];
        if (!L) return;
        var inst = pick(R, L.insts);
        var startDeg = L.lo + Math.floor(R() * (L.hi - L.lo + 1));
        var t0 = m.start + 0.6 + hi * 1.7 + R() * 0.5;
        /* 2 cümle: ikinci cümle FARKLI kontur (gelişme, tekrar değil) */
        for (var phrase = 0; phrase < 2; phrase++) {
          var shape = phrase === 0 ? L.shape : pick(R, SHAPES.filter(function (s) { return s !== L.shape; }));
          var n = 7 + Math.floor(R() * 3);
          var degs = contourSeq(R, shape, n, startDeg + phrase * 2);
          var noteDur = beat * (1.0 + R() * 0.35);
          for (var k = 0; k < degs.length; k++) {
            var t = t0 + k * (noteDur + beat * 0.12);
            if (t >= m.start + m.dur - 0.4) break;
            var midi = degToMidi(degs[k], rootM);
            if (midi < 26 || midi > 106) continue;
            var ev1 = {
              inst: inst, midi: midi, t: +t.toFixed(4),
              d: +(noteDur * (0.92 + R() * 0.2)).toFixed(4),
              v: +(0.40 + R() * 0.14).toFixed(3)
            };
            /* palet giysisi + keskin kontur (renk boyama metaforu) */
            var MX = root.KonserMix;
            if (MX && MX.dress) MX.dress(ev1);
            else { ev1.px = 0.1; ev1.pz = 0.3; ev1.cut = 1.1; ev1.wet = 1; ev1.amp = 1; }
            ev1.cut = +clamp((ev1.cut || 1) * 1.18, 0.55, 1.5).toFixed(3);   // keskin kontur
            ev1.amp = +clamp((ev1.amp || 1) * 0.58, 0.45, 1.35).toFixed(3);  // yüksek değil, NET
            ev1.pz = +clamp((ev1.pz || 0.3) * 0.75, 0.05, 2.2).toFixed(3);   // öne
            ev1.wet = +clamp((ev1.wet || 1) * 1.05, 0.55, 1.6).toFixed(3);
            ev1.kontur = hat + (phrase + 1);
            plan.events.push(ev1);
            if (m.events) m.events.push(ev1);
            stats.lineNotes++;
          }
          t0 += (n * (noteDur + beat * 0.12)) + beat * (1.2 + R() * 1.2);   // cümle arası SUS
        }
      });
    });
  }
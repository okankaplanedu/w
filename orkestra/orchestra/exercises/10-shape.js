function shape(list, up) {
      list.forEach(function (w) {
        var t0 = w.start * bar, t1 = (w.start + w.len) * bar;
        ev.forEach(function (e) {
          if (e.t < t0 || e.t >= t1) return;
          var prog = (e.t - t0) / (t1 - t0);
          var k = up ? Math.sin(Math.PI * prog) : -Math.sin(Math.PI * prog);
          /* dinamik: tepe/çukur */
          e.v = Math.max(0.06, Math.min(1.35, e.v * (1 + k * w.amp * 0.55)));
          /* düşüşte pes tarafa çekilme, yükselişte tize açılma */
          if (e.px != null) e.px = Math.max(-1, Math.min(1, e.px + k * w.amp * 0.30));
          if (up) info.rises++; else info.falls++;
        });
        /* jest katmanı: yükselişte tırmanan yaylı, düşüşte inen çello */
        var ch = chordAt[w.start] || o.chord || [57, 60, 64];
        var steps = 6;
        for (var i = 0; i < steps; i++) {
          var tt = t0 + (t1 - t0) * (i / steps);
          var mm = snap(ch[0] + 12 + (up ? i * 2 : -i * 2));
          push(up ? 'violin' : 'cello', mm, tt, beat * 0.9,
            (up ? 0.42 + i * 0.06 : 0.40 - i * 0.03) * w.amp * (up ? pal.str : pal.str));
        }
      });
    }
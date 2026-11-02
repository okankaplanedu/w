function schedule() {
    if (!state.playing || !state.score) return;
    var sc = state.score, ev = sc.events;
    var horizon = A.now() + state.lookAhead;
    while (state.nextIdx < ev.length) {
      var e = ev[state.nextIdx];
      if (!isFinite(e.t) || !isFinite(e.midi) || !isFinite(e.d) || !isFinite(e.v)) { state.nextIdx++; continue; }
      var at = state.startAt + e.t;
      if (at > horizon) break;
      /* enstrüman yüklenmediyse sessizce geç (çızırtı yok) */
      /* SUS/ATEŞKES BÖLGESİ: orkestra el çeker (dur işareti) — sadece solo/koro kalır */
      if (state.ceaseBars && state.ceaseBars[Math.floor(e.t / sc.bar)]) {
        /* davullar susmaz: inançlı metronom devam eder */
        var soloOK = (e.inst === 'voice_oohs' || e.inst === 'choir_aahs' ||
          e.inst === 'timpani' || e.inst === 'taiko_drum' || e.inst === 'melodic_tom' ||
          e.inst === 'woodblock' || e.inst === 'orchestra_hit' ||
          e.inst === 'oboe' || e.inst === 'tremolo_strings');
        state.nextIdx++;
        if (!soloOK) continue;
      }
      A.note(e.inst, e.midi, at, e.d, e.v, (e.px != null ? { px: e.px, pz: e.pz } : null));
      state.notesPlayed++;
      state.activeInst[e.inst] = A.now();
      state.nextIdx++;
    }
    /* döngü bitti mi? → yeni beste (gerçek zamanlı, boşluksuz) */
    var endAt = state.startAt + sc.totalSec;
    if (state.nextIdx >= ev.length && A.now() > endAt + 0.4) {
      newScore(false);
      flashLoop();
    }
    /* UI */
    var elapsed = A.now() - state.startAt;
    var bar = Math.floor(elapsed / sc.bar);
    if ($('#barInfo')) $('#barInfo').textContent =
      Math.min(sc.duration, Math.max(0, bar)) + ' / ' + sc.duration + ' ölçü';
    if ($('#clockInfo')) $('#clockInfo').textContent = fmt(elapsed);
    var si = 0;
    for (var i = 0; i < sc.sections.length; i++) if (elapsed >= sc.sections[i].start) si = i;
    if (si !== state.secIdx) { state.secIdx = si; paintSection(); }
    paintFront(bar);
    paintCorps(bar);
    paintEmotion(bar);
    drawTimeline(elapsed);
  }
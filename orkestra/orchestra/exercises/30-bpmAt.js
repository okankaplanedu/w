function bpmAt(plan, t) {
    var mv = moveAt(plan, t);
    if (!mv || mv.item.type !== 'mov') {
      /* dinlenme/yankı: en son bölümün son BPM'i */
      var last = plan.movements[plan.movements.length - 1];
      return last.bpmTo;
    }
    var m = plan.movements[mv.idx];
    var f = clamp((t - m.start) / Math.max(0.001, m.dur), 0, 1) * (m.bpmList.length - 1);
    var i = Math.floor(f), fr = f - i;
    var a = m.bpmList[i], b = m.bpmList[Math.min(m.bpmList.length - 1, i + 1)];
    return Math.round(a + (b - a) * fr);
  }
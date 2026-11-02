function moveAt(plan, t) {
    for (var i = 0; i < plan.timeline.length; i++) {
      var it = plan.timeline[i];
      if (t >= it.start && t < it.start + it.dur) return { item: it, idx: it.idx, i: i };
    }
    return null;
  }
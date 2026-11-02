function buildPlan(autoPlay) {
    if (state.playing) stop();
    var plan = K.build({ seed: state.seed, profile: state.profileIdx, targetSec: state.targetSec });
    if (!plan) { flash('motor hazır değil'); return; }
    state.plan = plan;
    var tonicLabel = el('kTon'); if (tonicLabel) tonicLabel.textContent = plan.tonicName;
    state.nextIdx = 0;
    renderPlan(plan);
    drawTimeline(0);
    var kn = el('kNow'); if (kn) kn.textContent = 'hazır · ' + plan.kimlik.aranjman + ' · ' + plan.tonicName;
    var pi = el('kPlanInfo'); if (pi) pi.textContent = K.describe(plan) + ' · ' + plan.kimlik.fazGecis + (plan.varya ? ' · ' + plan.kimlik.varya : '');
    if (autoPlay) start();
  }
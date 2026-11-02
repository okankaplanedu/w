function masterMonitor() {
    if (!ctx || ctx.state !== 'running' || !monitor) return;
    monitor.getFloatTimeDomainData(meterData);
    var sum = 0, peak = 0;
    for (var i = 0; i < meterData.length; i++) {
      var x = meterData[i]; sum += x*x; peak = Math.max(peak, Math.abs(x));
    }
    masterPeak = peak; masterRms = Math.sqrt(sum / meterData.length);
    monitor.getFloatFrequencyData(freqData);
    var highPower = 0, allPower = 0;
    for (var j = 1; j < freqData.length; j++) {
      var power = Math.pow(10, freqData[j] / 10);
      if (!isFinite(power)) continue;
      allPower += power;
      if (j * ctx.sampleRate / monitor.fftSize >= 3500) highPower += power;
    }
    var ratio = highPower / Math.max(1e-12, allPower);
    var reduce = masterConfig.dynamic && masterRms > 0.012 ? -Math.min(5, Math.max(0, (ratio - 0.12) * 16)) : 0;
    trebleReduction += (reduce - trebleReduction) * (reduce < trebleReduction ? 0.35 : 0.08);
    paramSmooth(deEsser.gain, trebleReduction, 0.16);
    // Sessizlikte kazancı yükseltmez; yalnızca tepe artışlarında sınırlı azaltır.
    var target = masterConfig.dynamic && peak > 0.72 ? Math.max(0.60, autoGain * 0.72 / peak) : 1;
    autoGain += (target - autoGain) * (target < autoGain ? 0.24 : 0.012);
    paramSmooth(dynamicGain.gain, autoGain, target < autoGain ? 0.12 : 1.2);
  }
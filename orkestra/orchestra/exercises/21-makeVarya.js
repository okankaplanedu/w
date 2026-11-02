function makeVarya(R) {
    return {
      cellRotate: +(0.55 + R() * 0.30).toFixed(2),   // akor hücresi dönüş olasılığı
      seqRotate: +(0.25 + R() * 0.25).toFixed(2),    // solo dizi döndürme
      seqSwap: +(0.30 + R() * 0.30).toFixed(2),      // komşu nota takası
      progSwap: +(0.18 + R() * 0.27).toFixed(2),     // progresyon ölçü bloğu takası
      cellDens: +(0.85 + R() * 0.30).toFixed(2),     // hücre ritim yoğunluğu
      motifFlip: +(0.08 + R() * 0.14).toFixed(2),    // motif aynası olasılığı
      rubato: +(0.4 + R() * 1.0).toFixed(2),         // mikro zaman salınımı
      durJitter: +(0.08 + R() * 0.12).toFixed(2),    // süre titreşimi
      panScale: +(0.94 + R() * 0.16).toFixed(2),     // 3B sahne genişliği
      tempoFeel: +(0.97 + R() * 0.06).toFixed(3),    // tempo tat farkı
      tilt: pick(R, ['str', 'brass', 'wood', 'choir', 'bell', 'perc']), // öne çıkan duygu ailesi
      tiltAmt: +(0.05 + R() * 0.06).toFixed(2),
      fp: ''
    };
  }
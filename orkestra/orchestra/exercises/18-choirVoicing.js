function choirVoicing(chord, mode) {
    var base = chord[0];
    if (mode === 'oohs') return [base + 12, chord[1] + 12, chord[2] + 12];
    if (mode === 'aahs') return [base, chord[1], chord[2], chord[2] + 12];
    return [base - 12, base, chord[1], chord[2], chord[2] + 12];   // tutti
  }
function timpPitches(chord) {
    var root = chord[0];
    while (root > 48) root -= 12;          // D2–D#3 aralığına indir
    while (root < 36) root += 12;
    var fifth = root;
    for (var i = 0; i < 12; i++) {
      fifth++;
      if (((fifth % 12) + 12) % 12 === (((chord[0] + 7) % 12) + 12) % 12) break;
    }
    return [root, fifth];
  }
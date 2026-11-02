function uniqueSeed(seed) {
    seed = seed >>> 0;
    while (SEED_LEDGER[seed]) seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0;
    SEED_LEDGER[seed] = 1;
    return seed;
  }
var Hamming = function() {};

Hamming.prototype.compute = function(a, b) {
  // Short circuit an exact match.
  if (a === b) { return 0; }
  if (a.length !== b.length) { throw "DNA strands must be of equal length."; }
  return [...a].reduce((pV, cV, i) => (cV == b[i]) ? pV : ++pV, 0);
};

module.exports = Hamming;

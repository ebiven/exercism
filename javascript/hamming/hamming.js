var Hamming = function() {};

Hamming.prototype.compute = function(a, b) {
  // Short circuit an exact match.
  if (a === b) { return 0; }
  if (a.length !== b.length) { throw "DNA strands must be of equal length."; }
  let diff = 0;
  for (let i = 0; i <= a.length; i++) {
    if (a[i] !== b[i]) { diff++; }
  }
  return diff;
};

module.exports = Hamming;

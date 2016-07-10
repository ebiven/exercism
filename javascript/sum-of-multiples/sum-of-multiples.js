var SumOfMultiples = function(factors) {
  if (!(this instanceof SumOfMultiples)) {
    return new SumOfMultiples(factors);
  }
  this.factors = factors;
};

SumOfMultiples.prototype.to = function(limit) {
  let out = 0;
  for (var x=1; x<limit; x++) {
    if (this.factors.some((f) => x % f == 0)) {
      out += x;
    }
  }
  return out;
};

module.exports = SumOfMultiples;

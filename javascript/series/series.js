var Series = function(input) {
  this.input = input;
  this.digits = [...input].map((i) => parseInt(i, 10));
};

Series.prototype.slices = function(size) {
  if (size > this.input.length) { throw new Error('Slice size is too big.'); }
  let slices = [];
  for (var x=0; x+size<=this.input.length; x++) {
    slices.push(new Series(this.input.slice(x, x+size)).digits);
  }
  return slices;
};

module.exports = Series;

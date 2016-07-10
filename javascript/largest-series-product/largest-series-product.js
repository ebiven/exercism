var Series = function(series) {
  if (!series.match(/^\d*$/g)) { throw new Error('Invalid input.'); }
  this.series = [...series];
};

Series.prototype.largestProduct = function(size) {
  if (size > this.series.length) { throw new Error('Slice size is too big.'); }
  if (this.series.length == 0 || size == 0) { return 1; }
  if (size < 0) { throw new Error('Invalid input.'); }
  let out = 0;
  for (var x=0; x<=this.series.length-size; x++) {
    let slice = this.series.slice(x, x+size);
    let product = slice.reduce((p, c) => p * c, 1);
    out = (product > out) ? product : out;
  }
  return out;
};

module.exports = Series;

// Oh good, the binary problem with two character changes.
const Trinary = function(value) {
  this.value = value;
};

Trinary.prototype.toDecimal = function() {
  if (!this.value.match(/^[012]+$/)) { return 0; }
  let out = 0;
  let remaining = this.value.length;
  [...this.value].forEach((i) => {
    out += i * Math.pow(3, --remaining);
  });
  return out;
};

module.exports = Trinary;

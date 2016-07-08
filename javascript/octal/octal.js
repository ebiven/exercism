// Binary and Trinary, again.
var Octal = function(value) {
  this.value = value;
};

Octal.prototype.toDecimal = function() {
  if (!this.value.match(/^[0-7]+$/)) { return 0; }
  let out = 0;
  let remaining = this.value.length;
  [...this.value].forEach((i) => {
    out += i * Math.pow(8, --remaining);
  });
  return out;
};

module.exports = Octal;

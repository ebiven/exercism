// Binary and Trinary, again.
var Hexadecimal = function(value) {
  this.value = value;
};

Hexadecimal.prototype.toDecimal = function() {
  if (!this.value.match(/^[a-f0-9]+$/)) { return 0; }
  let out = 0;
  let remaining = this.value.length;
  [...this.value].forEach((i) => {
    out += this.getInteger(i) * Math.pow(16, --remaining);
  });
  return out;
};

Hexadecimal.prototype.getInteger = function(i) {
  switch (i) {
    case 'a': return 10;
    case 'b': return 11;
    case 'c': return 12;
    case 'd': return 13;
    case 'e': return 14;
    case 'f': return 15;
    default : return parseInt(i, 10);
  }
};

module.exports = Hexadecimal;

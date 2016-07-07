var Binary = function(value) {
  this.value = value;
};

Binary.prototype.toDecimal = function() {
  if (!this.value.match(/^[01]+$/)) { return 0; }
  let out = 0;
  let remaining = this.value.length;
  [...this.value].forEach((i) => {
    out += i * Math.pow(2, --remaining);
  });
  return out;
};

module.exports = Binary;

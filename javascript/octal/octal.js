// Binary and Trinary, again.
var Octal = function(value) {
  this.value = value;
};

Octal.prototype.toDecimal = function() {
  return DecimalConverter(this.value, /^[0-7]+$/, 8);
};

module.exports = Octal;

const DecimalConverter = function(value, matchRegex, base) {
  if (!value.match(matchRegex)) { return 0; }
  return [...value].reverse().reduce((pV, cV, index) =>
    pV + cV * Math.pow(base, index), 0);
};

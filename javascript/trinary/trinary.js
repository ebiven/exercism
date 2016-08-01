// Oh good, the binary problem with two character changes.
const Trinary = function(value) {
  this.value = value;
};

Trinary.prototype.toDecimal = function() {
  return DecimalConverter(this.value, /^[0-2]+$/, 3);
};

module.exports = Trinary;

const DecimalConverter = function(value, matchRegex, base) {
  if (!value.match(matchRegex)) { return 0; }
  return [...value].reverse().reduce((pV, cV, index) =>
    pV + cV * Math.pow(base, index), 0);
};

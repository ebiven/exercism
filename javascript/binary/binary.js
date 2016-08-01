const Binary = function(value) {
  this.value = value;
};

Binary.prototype.toDecimal = function() {
  return DecimalConverter(this.value, /^[01]+$/, 2);
};

module.exports = Binary;

const DecimalConverter = function(value, matchRegex, base) {
  if (!value.match(matchRegex)) { return 0; }
  return [...value].reverse().reduce((pV, cV, index) =>
    pV + cV * Math.pow(base, index), 0);
};

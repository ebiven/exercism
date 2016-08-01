// Binary and Trinary, again.
var Hexadecimal = function(value) {
  this.value = value;
};

Hexadecimal.prototype.toDecimal = function() {
  return DecimalConverter(this.value, /^[a-f0-9]+$/, 16);
};

module.exports = Hexadecimal;

const DecimalConverter = function(value, matchRegex, base) {
  function getInteger(i) {
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

  if (!value.match(matchRegex)) { return 0; }
  return [...value].reverse().reduce((pV, cV, index) =>
    pV + getInteger(cV) * Math.pow(base, index), 0);
};

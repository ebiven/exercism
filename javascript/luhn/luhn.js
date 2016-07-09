const Luhn = function (input) {
  this.checkDigit = this.getCheckDigit(input);
  this.addends    = this.getAddends(input);
  this.checksum   = this.getChecksum(input);
  this.valid      = this.getValid(input);
};

Luhn.prototype.getCheckDigit = function (input) {
  return input % 10;
};

Luhn.prototype.getAddends = function (input) {
  let out = [];
  input = input.toString();
  for (var x=0; x<input.length; x++) {
    let i = input.length - x - 1;
    let current = parseInt(input[x], 10);
    if ((i+1)%2 == 0) {
      current *= 2;
      if (current > 10) { current -= 9; }
    }
    out.push(current);
  }
  return out;
};

Luhn.prototype.getChecksum = function (input) {
  return [...this.getAddends(input)].reduce((p, c) => {
    return p + c; }
  , 0);
};

Luhn.prototype.getValid = function (input) {
  return this.getChecksum(input) % 10 == 0;
};

Luhn.create = function (input) {
  let n = input + "0";
  let checkDigit = new Luhn(n).checksum;
  checkDigit = checkDigit % 10;
  if (checkDigit != 0) { checkDigit = 10 - checkDigit; }
  return parseInt(`${input}${checkDigit}`, 10);
};

module.exports = Luhn;

const Converter = function() {};

Converter.prototype.convert = function(digits, inputBase, outputBase) {
  if (!Converter.isValidBase(inputBase)) {
    throw new Error('Wrong input base');
  }

  if (!Converter.isValidBase(outputBase)) {
    throw new Error('Wrong output base');
  }

  if (!Converter.isValidDigits(digits, inputBase)) {
    throw new Error('Input has wrong format');
  }

  return Converter.toBase(outputBase, Converter.getTotal(inputBase, digits));
};

Converter.isValidBase = function(base) {
  return base != undefined &&
    base > 1 &&
    Number.isInteger(base);
};

Converter.isValidDigits = function(digits, inputBase) {
  const isEmpty = digits.length == 0;
  const leadingZero = digits.length > 1 && digits[0] == 0;
  const hasNegatives = digits.some((i) => i < 0);
  const tooHighForBase = digits.some((i) => i >= inputBase);
  return !(isEmpty || leadingZero || hasNegatives || tooHighForBase);
};

Converter.getTotal = function(inputBase, digits) {
  return digits
    .reverse()
    .reduce(function(pV, cV, i) {
      return pV += cV * Math.pow(inputBase, i);
    }, 0);
};

Converter.toBase = function(outputBase, total) {
  let out = [];
  let current = total;
  while (current >= outputBase) {
    out.push(current % outputBase);
    current = Math.floor(current / outputBase);
  }
  out.push(current % outputBase);
  return out.reverse();
};

module.exports = Converter;

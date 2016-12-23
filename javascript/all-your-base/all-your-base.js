const Converter = function() {};

Converter.prototype.convert = function(digits, input_base, output_base) {
  if (!Converter.isValidBase(input_base)) {
    throw new Error('Wrong input base');
  }

  if (!Converter.isValidBase(output_base)) {
    throw new Error('Wrong output base');
  }

  if (!Converter.isValidDigits(digits, input_base)) {
    throw new Error('Input has wrong format');
  }

  return Converter.to_base(output_base, Converter.get_total(input_base, digits));
};

Converter.isValidBase = function(base) {
  return base != undefined &&
    base > 1 &&
    Number.isInteger(base);
};

Converter.isValidDigits = function(digits, input_base) {
  const isEmpty = digits.length == 0;
  const leadingZero = digits.length > 1 && digits[0] == 0;
  const hasNegatives = digits.some((i) => i < 0);
  const tooHighForBase = digits.some((i) => i >= input_base);
  return !(isEmpty || leadingZero || hasNegatives || tooHighForBase);
};

Converter.get_total = function(input_base, digits) {
  return digits
    .reverse()
    .reduce(function(pV, cV, i) {
      return pV += cV * Math.pow(input_base, i);
    }, 0);
};

Converter.to_base = function(output_base, total) {
  let out = [];
  let current = total;
  while (current >= output_base) {
    out.push(current % output_base);
    current = Math.floor(current / output_base);
  }
  out.push(current % output_base);
  return out.reverse();
};

module.exports = Converter;

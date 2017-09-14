// Oh good, the binary problem with two character changes.
export default class Trinary {
  constructor(value) {
    this.value = value;
  }

  toDecimal() {
    return DecimalConverter(this.value, /^[0-2]+$/, 3);
  }
}

const DecimalConverter = function(value, matchRegex, base) {
  if (!value.match(matchRegex)) { return 0; }
  return [...value].reverse().reduce((pV, cV, index) =>
    pV + cV * Math.pow(base, index), 0);
};

const DecimalConverter = (value, matchRegex, base) => {
  if (!value.match(matchRegex)) { return 0; }
  return [...value].reverse().reduce((pV, cV, index) =>
    pV + cV * Math.pow(base, index), 0);
};

class Binary {
  constructor(value) {
    this.value = value;
  }

  toDecimal() {
    return DecimalConverter(this.value, /^[01]+$/, 2);
  }
}

export default Binary;

// Oh good, the binary problem with two character changes.
class DecimalConverter {
  constructor(value, matchRegex, base) {
    this.value      = value;
    this.matchRegex = matchRegex;
    this.base       = base;
  }

  toDecimal() {
    if (!this.value.match(this.matchRegex)) { return 0; }
    return [...this.value].reverse().reduce((pV, cV, index) =>
      pV + cV * Math.pow(this.base, index), 0);
  }
}

export default class Octal extends DecimalConverter {
  constructor(value) {
    super(value, /^[0-7]+$/, 8);
  }
}

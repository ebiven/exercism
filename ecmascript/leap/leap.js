class Year {
  constructor(year) {
    this.year = year;
  }

  isLeap() {
    const by4   = this.year % 4   == 0;
    const by100 = this.year % 100 == 0;
    const by400 = this.year % 400 == 0;

    return by4 && (!by100 || by400);
  }
}

export default Year;

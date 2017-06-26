class Gigasecond {
  constructor(dt) {
    this.dt = dt;
  }

  date() {
    return new Date(this.dt.getTime() + 1e12);
  }
}

export default Gigasecond;

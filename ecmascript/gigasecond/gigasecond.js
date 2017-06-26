class Gigasecond {
  constructor(dt) {
    this.dt = dt;
  }

  date() {
    return new Date(this.dt.getTime() + Math.pow(10, 12));
  }
}

export default Gigasecond;

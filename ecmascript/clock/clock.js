const pad = (n) => {
  if (n > 9) { return n.toString(); }
  return `0${n.toString()}`;
};

class Clock {
  constructor(hour, minutes) {
    this.minutes = hour * 60 + minutes;
  }

  plus(m) {
    this.minutes += m;
    return this;
  }

  minus(m) {
    this.minutes -= m;
    return this;
  }

  equals(other) {
    return this.toString() === other.toString();
  }

  hourPart() {
    return Math.floor(this.minutes / 60) % 24;
  }

  minutePart() {
    return this.minutes % 60;
  }

  toString() {
    // Our simple math doesn't like negative values. Keep adding
    // days until we're positive.
    while (this.minutes < 0) { this.minutes += 1440; }
    return `${pad(this.hourPart())}:${pad(this.minutePart())}`;
  }
}

export default function(hour, minutes = 0) {
  return new Clock(hour, minutes);
};

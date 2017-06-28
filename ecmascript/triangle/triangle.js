class Triangle {
  constructor(...sides) {
    this._sides = sides.sort((a,b) => a-b);
  }

  kind() {
    const [a, b, c] = this._sides;
    if (a <= 0 || a+b < c) { throw new Error(); }

    const unique = new Set(this._sides);
    switch (unique.size) {
      case 1: return 'equilateral';
      case 2: return 'isosceles';
      default: return 'scalene';
    }
  }
}

export default Triangle;

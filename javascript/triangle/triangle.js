var Triangle = function(a, b, c) {
  this.sides = [a, b, c];
};

Triangle.prototype.kind = function() {
  this.checkLegal();
  let [a, b, c] = this.sides;
  if (a == b && b == c)           { return 'equilateral'; }
  if (a == b || b == c || a == c) { return 'isosceles'; }
  return 'scalene';
};

Triangle.prototype.checkLegal = function() {
  if (this.sides.some((s) => { return s <= 0; })) { throw new Error(); }
  let [a, b, c] = this.sides.sort((x, y) => { return x > y; });
  if (a + b < c) { throw new Error; }
};

module.exports = Triangle;

var Squares = function(input) {
  this.input        = input;
  this.squareOfSums = this.doSquareOfSums(input);
  this.sumOfSquares = this.doSumOfSquares(input);
  this.difference   = this.squareOfSums- this.sumOfSquares ;
};

Squares.prototype.doSquareOfSums = function(input) {
  let sum = 0;
  for (var x=1; x<=input; x++) {
    sum += x;
  }
  return sum * sum;
};

Squares.prototype.doSumOfSquares = function(input) {
  let sum = 0;
  for (var x=1; x<=input; x++) {
    sum += x*x;
  }
  return sum;
};

module.exports = Squares;

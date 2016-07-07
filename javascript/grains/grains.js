var bigInt = require('./big-integer.js');

var Grains = function() {};

Grains.prototype.square = function(sq) {
  return bigInt(2).pow(sq - 1).toString();
};

Grains.prototype.total = function() {
  let total = bigInt(0);
  for (var x=0; x <= 64; x++) {
    total = total.add(this.square(x));
  }
  return total.toString();
};

module.exports = Grains;

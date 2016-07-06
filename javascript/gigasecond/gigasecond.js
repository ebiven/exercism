var Gigasecond = function(dt) {
  this.dt = dt;
};

Gigasecond.prototype.date = function(input) {
  return new Date(this.dt.getTime() + 1000000000000);
};

module.exports = Gigasecond;

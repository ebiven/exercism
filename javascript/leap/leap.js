var Year = function(year) {
  this.year = year;
};

Year.prototype.isLeap = function() {
  const by4   = this.year % 4   == 0;
  const by100 = this.year % 100 == 0;
  const by400 = this.year % 400 == 0;

  return by4 && (!by100 || by400);
};

module.exports = Year;

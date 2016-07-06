var Robot = function() {
  this.reset();
};

Robot.roster = {};

Robot.prototype.reset = function() {
  this.makeName();
};

Robot.prototype.makeName = function() {
  const letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  const numbers = "0123456789";
  let name = '';
  do {
    name = this.getRandomChars(letters, 2) + this.getRandomChars(numbers, 3);
  } while (Robot.roster.hasOwnProperty(name))
  Robot.roster[name] = true;
  this.name = name;
};

Robot.prototype.getRandomChars = function(set, number) {
  out = "";
  for (var i=0; i < number; i++) {
    out += set.charAt(Math.floor(Math.random() * set.length));
  }
  return out;
};

module.exports = Robot;

var Robot = function() {
  this.coordinates = [0,0];
  this.orientation;
  this.bearing;
};

Robot.orientations = {
  north : { a: ([x,y]) => [x, y+1], n: 'north', l: 'west',  r: 'east'  },
  east  : { a: ([x,y]) => [x+1, y], n: 'east',  l: 'north', r: 'south' },
  south : { a: ([x,y]) => [x, y-1], n: 'south', l: 'east',  r: 'west'  },
  west  : { a: ([x,y]) => [x-1, y], n: 'west',  l: 'south', r: 'north' }
};

Robot.prototype.orient = function(direction) {
  this.orientation = Robot.orientations[direction];
  if (!this.orientation) {
    throw 'Invalid Robot Bearing';
  }
  this.bearing = direction;
};

Robot.prototype.turnRight = function() {
  this.orientation = Robot.orientations[this.orientation.r];
  this.bearing = this.orientation.n;
};

Robot.prototype.turnLeft = function() {
  this.orientation = Robot.orientations[this.orientation.l];
  this.bearing = this.orientation.n;
};

Robot.prototype.at = function(x, y) {
  this.coordinates = [x, y];
};

Robot.prototype.advance = function() {
  this.coordinates = this.orientation.a(this.coordinates);
};

Robot.prototype.instructions = function(instructions) {
  let out = [];
  [...instructions].forEach((i) => {
    switch (i) {
      case 'L': out.push('turnLeft'); break;
      case 'R': out.push('turnRight'); break;
      case 'A': out.push('advance'); break;
    }
  });
  return out;
};

Robot.prototype.place = function(params) {
  this.coordinates = [params.x || 0, params.y || 0];
  this.orient(params.direction || 'north');
};

Robot.prototype.evaluate = function(instructions) {
  [...this.instructions(instructions)].forEach((i) => this[i]());
};

module.exports = Robot;

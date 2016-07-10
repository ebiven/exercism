const Queens = function(params) {
  this.white = (params && params.white) || [0,3];
  this.black = (params && params.black) || [7,3];
  if (this.white[0] == this.black[0] && this.white[1] == this.black[1]) {
    throw 'Queens cannot share the same space';
  }
};

Queens.prototype.toString = function() {
  let [wx, wy] = this.white;
  let [bx, by] = this.black;
  let out = '';
  for (var row=0; row<=7; row++) {
    for (var col=0; col<=7; col++) {
      out += (col == 0) ? '' : ' ';
      if (row == wx && col == wy) { out += 'W'; }
      else if (row == bx && col == by) { out += 'B'; }
      else { out += '_'; }
    }
    out += '\n';
  }
  return out;
};

Queens.prototype.canAttack = function() {
  let [wx, wy] = this.white;
  let [bx, by] = this.black;
  let xdist = Math.abs(wx - bx);
  let ydist = Math.abs(wy - by);
  return wx == bx || wy == by || xdist == ydist;
};

module.exports = Queens;

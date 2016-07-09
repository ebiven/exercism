var Triplet = function(a, b, c) {
  this.trips = [a, b, c];
};

Triplet.prototype.sum = function() {
  return this.trips.reduce((p, c) => p + c, 0);
};

Triplet.prototype.product = function() {
  return this.trips.reduce((p, c) => p * c, 1);
};

Triplet.prototype.isPythagorean = function() {
  let [a, b, c] = this.trips;
  return (a*a) + (b*b) == (c*c);
};

Triplet.where = function(params) {
  let min = params.minFactor || 1;
  let max = params.maxFactor;
  let sum = params.sum || false;
  let out = [];
  for (var a=min; a<max-1; a++) {
    for (var b=a+1; b<max; b++) {
      for (var c=b+1; c<=max; c++) {
        let t = new Triplet(a,b,c);
        if (t.isPythagorean()) {
          if (!sum) {
            out.push(t);
          }
          if (sum && sum == t.sum()) {
            out.push(t);
          }
        }
      }
    }
  }
  return out;
};

module.exports = Triplet;

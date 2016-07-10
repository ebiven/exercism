const Matrix = function(matrix) {
  this.rows = this.r(matrix);
  this.columns = this.c();
};

Matrix.prototype.r = function(matrix) {
  return matrix
    .split('\n')
    .map((row) => row
      .split(' ')
      .map((i) => parseInt(i, 10))
    );
};

Matrix.prototype.c = function() {
  let out = [];
  for (var c=0; c<this.rows[0].length; c++) {
    for (var r=0; r<this.rows.length; r++) {
      if (!out[c]) { out[c] = []; }
      out[c].push(this.rows[r][c]);
    }
  }
  return out;
};

module.exports = Matrix;

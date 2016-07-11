const Matrix = function(input) {
  this.rows = this.parseRows(input);
  this.columns = this.parseCols();
  this.saddlePoints = this.findSaddlePoints();
};

Matrix.prototype.parseRows = function(input) {
  let out = [];
  input.split('\n').forEach((row) => {
    out.push(row.split(' ').map((i) => parseInt(i, 10)));
  });
  return out;
};

Matrix.prototype.parseCols = function() {
  let rows = this.rows;
  let out = [];
  for (var x=0; x<rows.length; x++) {
    let col = [];
    rows.forEach((r) => {
      col.push(r[x]);
    });
    out.push(col);
  }
  return out;
};

Matrix.prototype.findSaddlePoints = function() {
  let rows = this.rows;
  let cols = this.columns;
  let out = [];
  for (var r=0; r<rows.length; r++) {
    for (var c=0; c<cols.length; c++) {
      let row = rows[r];
      let col = cols[c];
      let item = col[r];
      if (row.every((i) => i <= item) && col.every((i) => i >= item)) {
        out.push([r,c]);
      }
    }
  }
  return out;
};

module.exports = Matrix;

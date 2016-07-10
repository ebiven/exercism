var Triangle = function(numRows) {
  this.rows = this.getRows(numRows);
  this.lastRow = this.rows[this.rows.length-1];
};

Triangle.prototype.getRows = function(numRows) {
  let out = [[1]];
  for (var x=1; x<numRows; x++) {
    let row = [1];
    out[x-1].forEach((c, i, acc) => {
      row.push(c + (acc[i+1] || 0));
    }, row);
    out.push(row);
  }
  return out;
};

module.exports = Triangle;

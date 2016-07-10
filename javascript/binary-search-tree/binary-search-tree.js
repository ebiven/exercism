const Bst = function(data) {
  this.data = data;
  this.left;
  this.right;
};

Bst.prototype.insert = function(value) {
  let insertTo = 'right';
  if (value <= this.data) {
    insertTo = 'left';
  }
  if (!this[insertTo]) {
    this[insertTo] = new Bst(value);
  } else {
    this[insertTo].insert(value);
  }
  return this;
};

Bst.prototype.each = function(f) {
  if (this.left) { this.left.each(f); }
  f(this.data);
  if (this.right) { this.right.each(f); }
};

module.exports = Bst;

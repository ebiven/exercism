var CustomSet = function(array) {
  this.set = [];
  array = array || [];
  [...array].forEach((i) => this.add(i));
};

CustomSet.prototype.toList = function() {
  return this.set.sort((a,b) => a - b);
};

CustomSet.prototype.size = function() {
  return this.set.length;
};

CustomSet.prototype.empty = function() {
  return this.size() == 0;
};

CustomSet.prototype.contains = function(item) {
  return this.toList().some((i) => i == item);
};

CustomSet.prototype.intersection = function(set2) {
  let out = new CustomSet();
  this.toList().forEach((item) => {
    if (set2.contains(item)) {
      out.add(item);
    }
  });
  return out;
};

CustomSet.prototype.difference = function(set2) {
  let intersection = this.intersection(set2);
  let out = new CustomSet();
  this.toList().forEach((item) => {
    if (!intersection.contains(item)) {
      out.add(item);
    }
  });
  return out;
};

CustomSet.prototype.disjoint = function(set2) {
  return this.intersection(set2).empty();
};

CustomSet.prototype.eql = function(set2) {
  return set2.size() == this.size() && this.subset(set2);
};

CustomSet.prototype.subset = function(set2) {
  let subset = true;
  set2.toList().forEach((item) => {
    if (!this.contains(item)) {
      subset = false;
    }
  });
  return subset;
};

CustomSet.prototype.add = function(item) {
  if (!this.contains(item)) {
    this.set.push(item);
  }
  return this;
};

CustomSet.prototype.delete = function(item) {
  this.set = this.set.filter((i) => i != item);
  return this;
};

CustomSet.prototype.clear = function() {
  this.set = [];
  return this;
};

CustomSet.prototype.union = function(set2) {
  let out = new CustomSet(this.toList());
  set2.toList().forEach((item) => {
    out.add(item);
  });
  return out;
};

module.exports = CustomSet;

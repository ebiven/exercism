const Flattener = function() {};

Flattener.prototype.flatten = function(input, acc=[]) {
  input.forEach((i) => {
    if (Array.isArray(i)) {
      return this.flatten(i, acc);
    } else if (i != null) {
      acc.push(i);
    }
  });
  return acc;
};

module.exports = Flattener;

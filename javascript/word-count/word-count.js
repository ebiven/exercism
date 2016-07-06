var Words = function() {};

Words.prototype.count = function(input) {
  let counts = {};
  const words = input.match(/\S+/g);
  words.forEach((w) => {
    w = w.toLowerCase();
    counts[w] = counts.hasOwnProperty(w) ? counts[w] + 1 : 1;
  });
  return counts;
};

module.exports = Words;

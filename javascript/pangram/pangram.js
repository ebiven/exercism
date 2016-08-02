var Pangram = function(sentence) {
  this.sentence = sentence.toLowerCase().replace(/[^a-z]/g, '')
};

Pangram.prototype.isPangram = function() {
  return "abcdefghijklmnopqrstuvwxyz".split('').every((l) => {
    return this.sentence.includes(l);
  });
};

module.exports = Pangram;

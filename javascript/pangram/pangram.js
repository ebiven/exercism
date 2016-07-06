var Pangram = function(sentence) {
  this.sentence = sentence.toLowerCase().replace(/[^a-z]/g, '');
};

Pangram.prototype.isPangram = function() {
  let letters = [];
  [...this.sentence]
    .forEach((l) => {
      if (!letters.includes(l)) {
        letters.push(l);
      }
    });
  return letters.length == 26;
};

module.exports = Pangram;

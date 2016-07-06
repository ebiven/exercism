var Isogram = function(word) {
  this.word = word.toLowerCase();
};

Isogram.prototype.isIsogram = function() {
  let letters = [];
  return [...this.word]
    .reduce((pV, l) => {
      if (pV === false || letters.includes(l)) { return false; }
      if (l.match(/[^ -]/)) { letters.push(l); }
      return true;
    }, true);
};

module.exports = Isogram;

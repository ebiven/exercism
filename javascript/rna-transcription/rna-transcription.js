var DnaTranscriber = function() {};

DnaTranscriber.prototype.translations = {
  "A": "U",
  "C": "G",
  "T": "A",
  "G": "C",
};

DnaTranscriber.prototype.toRna = function(strand) {
  return [...strand]
    .map((i) => this.translations[i])
    .join("");
};

module.exports = DnaTranscriber;

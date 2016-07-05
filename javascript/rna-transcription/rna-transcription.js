var DnaTranscriber = function() {};

DnaTranscriber.prototype.translations = {
  "A": "U",
  "C": "G",
  "T": "A",
  "G": "C",
};

DnaTranscriber.prototype.toRna = function(strand) {
  let self = this;
  return [...strand]
    .map((i) => { return self.translations[i]; })
    .join("");
};

module.exports = DnaTranscriber;

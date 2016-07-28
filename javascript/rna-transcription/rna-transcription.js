var DnaTranscriber = function() {};

DnaTranscriber.translate = function(i) {
  return {
    "A": "U",
    "C": "G",
    "T": "A",
    "G": "C",
  }[i];
};

DnaTranscriber.prototype.toRna = function(strand) {
  return [...strand]
    .map(DnaTranscriber.translate)
    .join("");
};

module.exports = DnaTranscriber;

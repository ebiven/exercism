var Anagram = function(word) {
  this.word = word;
};

Anagram.prototype.matches = function(inputs) {
  inputs = Array.isArray(inputs) ? inputs : [].slice.call(arguments, 0);
  const sortedWord = this.sortedChars(this.word);
  let matches = [];
  inputs.forEach((input) => {
    if (this.word.toLowerCase() == input.toLowerCase()) {
      return;
    }
    if (sortedWord == this.sortedChars(input)) {
      matches.push(input);
    }
  });
  return matches;
};

Anagram.prototype.sortedChars = function(word) {
  word = word.toLowerCase();
  return [...word].sort().join();
};

module.exports = Anagram;

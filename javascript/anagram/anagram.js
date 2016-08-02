const Anagram = function(word) {
  this.word = word;
};

Anagram.prototype.matches = function(inputs) {
  inputs = Array.isArray(inputs) ? inputs : [].slice.call(arguments, 0);
  return inputs.filter((i) => Anagram.isAnagram(this.word, i));
};

Anagram.isAnagram = function(word1, word2) {
  return Anagram.sortedChars(word1) == Anagram.sortedChars(word2) &&
           word1.toLowerCase() != word2.toLowerCase();
};

Anagram.sortedChars = function(word) {
  return [...word.toLowerCase()].sort().join();
};

module.exports = Anagram;

module.exports = class Anagram
  constructor: (word) ->
    @word = word.toLowerCase()

  match: (inputs) ->
    inputs = if Array.isArray(inputs) then inputs else [].slice.call(arguments, 0)
    inputs
      .map((i) -> i.toLowerCase())
      .filter (i) => isAnagram(@word, i)


isAnagram = (word1, word2) ->
  word1 != word2 and sortedChars(word1) == sortedChars(word2)

sortedChars = (word) -> word.split('').sort().join()

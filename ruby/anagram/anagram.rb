class Anagram
  def initialize(word)
    @word       = word.downcase
    @word_chars = @word.chars.sort
  end

  def match(candidates)
    candidates.select do |i|
      i = i.downcase
      i.chars.sort == @word_chars && i != @word
    end
  end
end

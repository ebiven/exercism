class Phrase
  def initialize(phrase)
    @phrase = phrase.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    @phrase.inject(Hash.new(0)) do |acc, word|
      acc[word] += 1
      acc
    end
  end
end

module BookKeeping
  VERSION = 1
end

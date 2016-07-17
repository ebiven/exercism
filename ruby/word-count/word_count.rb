class Phrase
  def initialize(phrase)
    @phrase = phrase.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    h = Hash.new(0)
    @phrase.each { |word| h[word] += 1 }
    h
  end
end

module BookKeeping
  VERSION = 1
end

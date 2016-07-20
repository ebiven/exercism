module PigLatin
  def self.translate(phrase)
    phrase.split.map(&method(:pig_word)).join(' ')
  end

  def self.pig_word(word)
    if @@vowel_sounds.any? { |s| word.start_with?(s) }
      "#{word}ay"
    elsif starter = @@consonant_sets.select { |s| word.start_with?(s) }.first #@@consonant_sets.any? { |s| word.start_with?(s) }
      "#{word.slice(starter.length..word.length)}#{starter}ay"
    else
      "#{word.slice(1..word.length)}#{word.slice(0,1)}ay"
    end
  end

  @@vowel_sounds   = %w(a e i o u yt xr)
  @@consonant_sets = %w(ch thr th sch qu squ)
end

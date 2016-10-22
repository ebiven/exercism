module Isogram
  def self.is_isogram?(candidate)
    cps = candidate.downcase.gsub(/[^\p{L}]/, '').chars.to_a
    cps.length == cps.uniq.length
  end
end

module BookKeeping
  VERSION = 1
end

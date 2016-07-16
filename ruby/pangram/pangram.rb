module Pangram
  def self.is_pangram?(s)
    ('a'..'z').all? {|l| s.downcase.include?(l) }
  end
end

module BookKeeping
  VERSION = 2
end

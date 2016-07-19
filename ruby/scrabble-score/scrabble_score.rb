class Scrabble
  # Human readable version.
  @@score_map = {
    1 => %w(a e i o u l n r s t),
    2 => %w(d g),
    3 => %w(b c m p),
    4 => %w(f h v w y),
    5 => %w(k),
    8 => %w(j x),
    10 => %w(q z)
  }
  @@points = @@score_map.each_with_object({}) do |(k,vs), acc|
    vs.each { |v| acc[v] = k }
  end

  def initialize(word)
    @word = word.to_s.downcase
  end

  def self.score(word)
    new(word).score
  end

  def score
    @word.chars.inject(0) { |acc, l| acc += @@points.fetch(l) { 0 } }
  end
end

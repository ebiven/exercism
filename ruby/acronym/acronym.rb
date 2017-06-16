class Acronym
  def self.abbreviate(input)
    input.scan(/[A-Z]+[a-z]*|[a-z]+/).map { |i| i[0] }.join.upcase
  end
end

module BookKeeping
  VERSION = 1
end

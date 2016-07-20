class WordProblem
  attr_reader :answer

  def initialize(text)
    parts = text.scan(@@parser)
    raise ArgumentError if parts.length < 3 || parts.length % 2 == 0
    out = parts.first.to_i
    (1..parts.length).step(2).each do |i|
      operator = parts[i]
      r        = parts[i+1].to_i
      case operator
      when 'plus'          then out += r
      when 'minus'         then out -= r
      when 'multiplied by' then out *= r
      when 'divided by'    then out /= r
      end
    end
    @answer = out
  end

  @@parser = /\-?\d+|plus|minus|divided by|multiplied by/
end

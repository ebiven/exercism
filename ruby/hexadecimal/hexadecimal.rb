class Hexadecimal
  def initialize(bin)
    @value = bin
  end

  def to_decimal
    return 0 if @value =~ /[^0-9a-f]/
    @value
      .chars
      .reverse
      .collect { |i| get_decimal(i) }
      .each_with_index
      .inject(0) { |acc, (i,j)| acc += i * 16**j }
  end

  def get_decimal(s)
    case s
    when "a" then 10
    when "b" then 11
    when "c" then 12
    when "d" then 13
    when "e" then 14
    when "f" then 15
    else s.to_i
    end
  end
end

module BookKeeping
  VERSION = 1
end

class Trinary
  def initialize(bin)
    @value = bin
  end

  def to_decimal
    return 0 if @value =~ /[^0-2]/
    @value
      .chars
      .reverse
      .collect(&:to_i)
      .each_with_index
      .inject(0) { |acc, (i,j)| acc += i * 3**j }
  end
end

module BookKeeping
  VERSION = 1
end

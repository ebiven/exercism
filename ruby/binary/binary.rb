class Binary
  def initialize(bin)
    raise ArgumentError if bin =~ /[^01]/
    @value = bin
  end

  def to_decimal
    @value
      .chars
      .reverse
      .collect(&:to_i)
      .each_with_index
      .inject(0) { |acc, (i,j)| acc += i * 2**j }
  end
end

module BookKeeping
  VERSION = 2
end

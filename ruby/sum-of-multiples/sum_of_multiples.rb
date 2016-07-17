class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def to(limit)
    (1..limit-1)
      .find_all { |i| @multiples.any? { |j| i % j == 0}}
      .inject(0) { |acc, i| acc += i }
  end
end

class Series
  def initialize(digits)
    raise ArgumentError if digits =~ /[^\d]/
    @digits = digits.chars.map(&:to_i)
  end

  def largest_product(window_size)
    raise ArgumentError if window_size > @digits.length || window_size < 0
    return 1 if @digits.empty? or window_size == 0
    out = 0
    @digits.each_cons(window_size) do |i|
      p = i.reduce(1, :*)
      out = p if p > out
    end
    out
  end
end

module BookKeeping
  VERSION = 2
end

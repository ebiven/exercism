class Series
  def initialize(digits)
    @digits = digits
  end

  def largest_product(window_size)
    raise ArgumentError if @digits =~ /[^\d]/
    raise ArgumentError if window_size > @digits.length || window_size < 0
    return 1 if @digits.empty? or window_size == 0
    @digits.chars.map(&:to_i).each_cons(window_size)
      .map { |w| w.reduce(1, :*) }
      .max
  end
end

module BookKeeping
  VERSION = 2
end

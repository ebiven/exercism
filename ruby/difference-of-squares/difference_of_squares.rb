class Squares
  def initialize(limit)
    @limit = limit
  end

  def square_of_sum
    sum = (1..@limit).reduce(0, :+)
    sum**2
  end

  def sum_of_squares
    (1..@limit).inject(0) {|sum, i| sum += i**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 3
end

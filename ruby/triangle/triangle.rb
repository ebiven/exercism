class Triangle
  attr_reader :kind

  def initialize(*sides)
    sides.sort!
    (a, b, c) = sides
    raise TriangleError unless a + b > c
    return @kind = :equilateral if a == c
    return @kind = :isosceles   if a == b || b == c
    @kind = :scalene
  end
end

class TriangleError < ArgumentError
end

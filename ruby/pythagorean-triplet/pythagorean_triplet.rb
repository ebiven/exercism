class Triplet
  def initialize(a, b, c)
    @sides = [a, b, c]
  end

  def sum
    @sides.inject(0, :+)
  end

  def product
    @sides.inject(1, :*)
  end

  def pythagorean?
    (a, b, c) = @sides
    a**2 + b**2 == c**2
  end

  def self.where(params)
    Triplets.new(params).to_a
  end
end

class Triplets
  def initialize(params)
    min_factor = params[:min_factor] || 1
    max_factor = params[:max_factor]
    sum        = params[:sum] || false
    @list = (min_factor..max_factor).to_a.combination(3).each_with_object([]) do |(a, b, c), acc|
      t = Triplet.new(a, b, c)
      acc.push t if t.pythagorean? && (!sum || t.sum == sum)
    end
  end

  def to_a
    @list
  end
end

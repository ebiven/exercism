class Palindromes
  def initialize(opts)
    @max = opts.fetch(:max_factor) { 99 }
    @min = opts.fetch(:min_factor) { 1  }
    @results = Hash.new
  end

  def generate
    (@min..@max).each do |x|
      (x..@max).each do |y|
        candidate = x*y
        if is_palindrome?(candidate)
          c = @results.fetch(candidate) { @results[candidate] = Product.new(candidate) }
          c.add_factors(x, y)
        end
      end
    end
  end

  def smallest
    @results.fetch(@results.keys.min)
  end

  def largest
    @results.fetch(@results.keys.max)
  end

  def is_palindrome?(n)
    n.to_s == n.to_s.reverse
  end
end

class Product
  attr_reader :value, :factors
  def initialize(value)
    @value = value
    @factors = []
  end

  def add_factors(x, y)
    @factors.push([x, y])
  end
end

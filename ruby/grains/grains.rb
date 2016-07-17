module Grains
  def self.square(num)
    2**(num - 1)
  end

  def self.total(to=64)
    (1..to).inject(0) { |sum, i| sum += square(i) }
  end
end

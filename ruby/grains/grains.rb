module Grains
  def self.square(num)
    2**(num - 1)
  end

  def self.total
    (1..64).inject(0) { |sum, i| sum += square(i) }
  end
end

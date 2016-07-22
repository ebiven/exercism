class PerfectNumber
  def self.classify(n)
    raise RuntimeError if n < 1
    sum = (1..n-1).select{ |i| n % i == 0 }.reduce(0, :+)
    return 'deficient' if sum < n
    return 'abundant'  if sum > n
    'perfect'
  end
end

module BookKeeping
  VERSION = 1
end

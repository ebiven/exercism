class PerfectNumber
  def self.classify(n)
    raise RuntimeError if n < 1
    sum = factors(n).reduce(1, :+)
    return 'deficient' if sum < n
    return 'perfect'   if sum == n
    return 'abundant'  if sum > n
  end

  def self.factors(n)
    out = []
    (1..n-1).each do |x|
      (x..n-1).each do |y|
        candidate = x*y
        out.push(x) if candidate == n
        out.push(y) if candidate == n
      end
    end
    out
  end
end

module BookKeeping
  VERSION = 1
end

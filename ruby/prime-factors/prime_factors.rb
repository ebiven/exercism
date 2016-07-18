module PrimeFactors
  def self.for(n, result=[])
    return [] if n < 2

    limit = Math.sqrt(n)
    x = 2

    if n % x != 0
      x = 3
      while ((n % x != 0) && ((x = x + 2) < limit))
        #noop
      end
    end
    x = (x <= limit) ? x : n
    result.push(x)

    return (x == n) ? result : self.for(n / x, result)
  end
end

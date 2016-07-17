module Prime
  def self.nth(limit)
    raise ArgumentError if limit < 1
    n = 2
    999_999.times do
      if check1(n)
        limit -= 1
        return n if limit == 0
      end
      n += 1
    end
  end

  def self.check1(n)
    return false if n <= 1
    return true  if n <= 3
    return false if n % 2 == 0 || n % 3 == 0
    check2(n, 5)
  end

  def self.check2(n, i)
    return true  if i**2 > n
    return false if n % i == 0
    return false if n % (i + 2) == 0
    check2(n, i + 6)
  end
end

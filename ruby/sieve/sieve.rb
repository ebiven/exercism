class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    set = (2..@limit).to_a
    (2..@limit).each do |i|
      set.reject! { |j| j % i == 0 && j > i }
    end
    set
  end
end

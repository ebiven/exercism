class CollatzConjecture
  def self.steps(num)
    raise ArgumentError if num < 1

    steps = 0
    until num == 1 do
      steps += 1
      if num.even?
        num = num / 2
        next
      end
      num = num * 3 + 1
    end
    steps
  end
end

module BookKeeping
  VERSION = 1
end

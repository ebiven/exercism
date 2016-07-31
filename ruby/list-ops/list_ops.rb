module ListOps
  VERSION = 1

  def self.arrays(input)
    out = 0
    input.each { out += 1 }
    out
  end

  def self.reverser(input)
    out = []
    until input.empty?
      out.push(input.pop)
    end
    out
  end

  def self.concatter(arr1, arr2)
    until arr2.empty?
      arr1.push(arr2.shift)
    end
    arr1
  end

  def self.mapper(input)
    input.each { |i| i += 1 }
  end

  def self.filterer(input)
    out = []
    until input.empty?
      val = input.shift
      out.push(val) if val.odd?
    end
    out
  end

  def self.sum_reducer(input)
    input.inject(0) { |acc, i| acc += i }
  end

  def self.factorial_reducer(input)
    input.inject(1) { |acc, i| acc *= i }
  end
end

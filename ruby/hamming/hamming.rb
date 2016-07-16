module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError unless strand1.length == strand2.length
    strand1.bytes.zip(strand2.bytes).count { |pair| pair[0] != pair[1] }
  end
end

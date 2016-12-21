module Transpose
  def self.transpose(input)
    lines = input.split("\n")
    max_length = lines.map(&:length).max

    lines
      .map { |l| l.ljust(max_length).chars }
      .transpose
      .map { |i| i.join.rstrip }
      .join("\n")
  end
end

module BookKeeping
  VERSION = 1
end

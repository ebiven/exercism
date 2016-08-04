module Diamond
  def self.make_diamond(letter)
    return "A\n" if letter == "A"

    dimension = (letter.codepoints.first - 64) * 2 - 1
    mid_point = dimension / 2
    range     = (0..mid_point).to_a
    range.concat (mid_point - 1).downto(0)
      .each_with_object([]) { |i, acc| acc.push(i) }

    range.each_with_object("") do |i, acc|
      a = Array.new(dimension, " ")
      a[mid_point - i] = (i + 65).chr
      a[mid_point + i] = (i + 65).chr
      acc << a.join('') + "\n"
    end
  end
end

#module BookKeeping
module Bookkeeping
  VERSION = 1
end

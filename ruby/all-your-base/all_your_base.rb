class BaseConverter
  def self.convert(input_base, digits, output_base)
    # Binary is the smallest base we allow.
    return nil if input_base < 2 or output_base < 2
    # Parts can't be negative or greater than their base allows.
    return nil if digits.any? { |d| d < 0 || d >= input_base }
    return [] if digits.length == 0
    t = get_total(input_base, digits)
    to_base(output_base, t)
  end

  private

  def self.get_total(input_base, digits)
    digits
      .reverse
      .each_with_index
      .inject(0) { |acc, (i,j)| acc += i * input_base**j }
  end

  def self.to_base(output_base, total)
    out = []
    current = total
    while current >= output_base do
      out.push(current % output_base)
      current = current / output_base
    end
    out.push(current % output_base)
    out.reverse
  end
end

module BookKeeping
  VERSION = 1
end

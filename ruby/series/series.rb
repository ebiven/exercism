class Series
  def initialize(input)
    @input = input.chars.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError if @input.length < size
    (0..@input.length - size).each_with_object([]) do |i, acc|
      acc.push @input.slice(i, size)
    end
  end
end

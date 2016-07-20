class Series
  def initialize(input)
    @input = input.chars.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError if @input.length < size
    @input.each_cons(size).to_a
  end
end

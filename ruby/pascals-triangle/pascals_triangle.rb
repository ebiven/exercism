class Triangle
  attr_reader :rows

  def initialize(size)
    @rows = [[1]]
    (1..size-1).each do |x|
      new_row = [1]
      @rows[x-1].each_with_index do |c, i|
        new_row.push(c + (@rows[x-1][i+1] || 0))
      end
      @rows.push(new_row)
    end
  end
end

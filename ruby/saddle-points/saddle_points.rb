class Matrix
  attr_reader :rows, :columns
  def initialize(input)
    @rows = input.split("\n").map { |r| r.split(" ").map(&:to_i) }
    @columns = @rows.transpose
  end

  def saddle_points
    out = []
    rows.each_with_index do |row, i|
      columns.each_with_index do |col, j|
        item = col[i]
        out.push([i,j]) if row.max == item && col.min == item
      end
    end
    out
  end
end

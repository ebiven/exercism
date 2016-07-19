class Queens
  attr_reader :white, :black

  def initialize(white: [0,3], black: [7,3])
    @white = white
    @black = black
    raise ArgumentError if @white == @black
  end

  def attack?
    (wx, wy) = @white
    (bx, by) = @black
    (wx==bx) || (wy==by) || ((wx-bx).abs == (wy-by).abs)
  end

  def to_s
    board = Array.new(8) { Array.new(8, "_") }
    board[@white[0]][@white[1]] = "W"
    board[@black[0]][@black[1]] = "B"
    board.map {|r| r.join(' ')}.join("\n")
  end
end

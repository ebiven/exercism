class Board
  BORDER_CHARS = ['+', '-', '|']
  BOARD_CHARS  = ['+', '-', '|', '*', ' ']

  def self.transform(board)
    new(board).transform
  end

  def initialize(board)
    @board = board
  end

  def transform
    validate
    @w = @board.first.length
    @h = @board.length
    (1..@h-2).each do |r|
      (1..@w-2).each do |c|
        if @board[r][c] == " "
          count = count_adjacent_mines(r,c)
          @board[r][c] = count.to_s if count > 0
        end
      end
    end
    @board
  end

  private

  def count_adjacent_mines(x,y)
    adjacents = [ [x-1, y-1], [x+0, y-1], [x+1, y-1],
                  [x-1, y+0],             [x+1, y+0],
                  [x-1, y+1], [x+0, y+1], [x+1, y+1] ]
    adjacents
      .select {|(i,j)| valid_cell?(i,j)}
      .inject(0) do |count, (i,j)|
        count += 1 if @board[i][j] == "*"
        count
      end
  end

  def valid_cell?(x, y)
    x >= 0 && x < @h && y > 0 && y <= @w
  end

  def validate
    raise ValueError unless @board.all? { |r| r.length == @board.first.length }
    raise ValueError unless @board.join.chars.all? { |c| BOARD_CHARS.include?(c) }
    raise ValueError unless @board.all? do |r|
      parts = r.chars
      BORDER_CHARS.include?(parts.first) && BORDER_CHARS.include?(parts.last)
    end
  end
end

ValueError = Class.new(StandardError)

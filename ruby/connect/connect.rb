class Board
  def initialize(board)
    board_o = board.map { |row| row.gsub(/ /, '').split('') }
    board_x = transpose_board(board_o, 'X')
    @pieces_o = pieces_for(build_board(board_o), 'O')
    @pieces_x = pieces_for(build_board(board_x), 'X')
    @goal_x = board_o.first.length - 1
  end

  def winner
    return 'X' if winner?(@pieces_x)
    return 'O' if winner?(@pieces_o)
    ""
  end

  def winner?(pieces)
    starting_pieces = pieces.select { |p| p.first == 0 }
    starting_pieces.any? { |p| adjacent?(p, pieces) }
  end

  def adjacent?(cell, pieces)
    (x, y, v) = cell
    return true if x == @goal_x
    next_pieces = get_adjacents(x, y, pieces)
    return false if next_pieces.length == 0
    pieces.delete(cell)
    next_pieces.any? { |np| adjacent?(np, pieces) }
  end

  def get_adjacents(x, y, pieces)
    adjacent_coords = [
      [x + 1, y],
      [x - 1, y],
      [x, y + 1],
      [x, y - 1],
      [x + 1, y - 1],
      [x - 1, y + 1]
    ]
    pieces.select do |(px, py, pv)|
      adjacent_coords.any? { |(ax, ay)| px == ax && py == ay  }
    end
  end

  def pieces_for(board, player)
    board.select { |p| p.last == player }
  end

  def build_board(board)
    pieces = []
    d = board.length - 1
    (0..d).each do |x|
      (0..d).each do |y|
        v = board[x][y]
        pieces.push([x, y, v])
      end
    end
    pieces
  end

  def transpose_board(board, player)
    board.transpose if player == 'X'
  end
end

module BookKeeping
  VERSION = 1
end

class Board
  def initialize(board)
    # Split the board into an array of arrays and remove spaces so that
    # we're left with just the raw values.
    board_o = board.map { |row| row.gsub(/ /, '').split('') }
    # Transpose the board so that we only have to check in a single
    # direction later.
    board_x = board_o.transpose
    # Turn the boards into arrays of the pieces with their
    # coordinates and values: [x, y, value]
    @pieces_o = pieces_for(build_board(board_o), 'O')
    @pieces_x = pieces_for(build_board(board_x), 'X')
    # Find the goal x coordinate. Winners go from 0 to this point.
    @goal_x = board_o.first.length - 1
  end

  def winner
    return 'X' if winner?(@pieces_x)
    return 'O' if winner?(@pieces_o)
    ""
  end

  def winner?(pieces)
    # Get all the pieces that are at x == 0, these are our starters.
    starting_pieces = pieces.select { |p| p.first == 0 }
    # Start the process to follow each of these and see if any reach
    # the goal x coordinate.
    starting_pieces.any? { |p| adjacent?(p, pieces) }
  end

  def adjacent?(piece, pieces)
    (x, y) = piece
    # If the x coordinate of this piece is the goal then we have a
    # winner, return true.
    return true if x == @goal_x
    # Otherwise get the potential next pieces.
    next_pieces = get_adjacents(x, y, pieces)
    # If there are no more adjacent pieces then we can terminate this
    # branch.
    return false if next_pieces.length == 0
    # Delete ourselves to prevent circular references.
    pieces.delete(piece)
    # Recurse through our adjacents until we satisfy one of the above
    # conditions.
    next_pieces.any? { |np| adjacent?(np, pieces) }
  end

  def get_adjacents(x, y, pieces)
    # Board is laid out in hexagons, not a grid. For any piece we can
    # have up to six adjacent pieces.
    adjacent_coords = [
      [x + 1, y],
      [x - 1, y],
      [x, y + 1],
      [x, y - 1],
      [x + 1, y - 1],
      [x - 1, y + 1]
    ]
    pieces.select do |(px, py)|
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
end

module BookKeeping
  VERSION = 1
end

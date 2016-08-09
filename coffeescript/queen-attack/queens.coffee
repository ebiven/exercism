module.exports = class Queens
  constructor: (queens) ->
    @white = queens?.white || [0,3]
    @black = queens?.black || [7,3]
    if @white[0] == @black[0] and @white[1] == @black[1]
      throw "Queens cannot share the same space"

  canAttack: () ->
    [wy, wx] = @white
    [_by, bx] = @black
    xdist = Math.abs(wx - bx)
    ydist = Math.abs(wy - _by)
    wx == bx || wy == _by || xdist == ydist

  toString: () ->
    [wy, wx] = @white
    [_by, bx] = @black
    out = ''
    for row in [0..7]
      for col in [0..7]
        out += if col == 0 then '' else ' '
        if row == wx && col == wy
          out += 'W'
        else if row == bx && col == _by
          out += 'B'
        else
          out += '_'

      out += '\n' if row < 7

    out

module.exports = class Pascal
  constructor: (numRows) ->
    @array = @getRows(numRows)

  getRows: (numRows) ->
    out = [[1]]
    for x in [1...numRows]
      row = [1]
      out[x-1].forEach((c, i, acc) ->
        row.push(c + (acc[i+1] || 0))
      , row)
      out.push(row)

    out

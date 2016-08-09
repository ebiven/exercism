module.exports = class Triangle
  constructor: (a, b, c) ->
    sorter  = (x, y) -> x > y

    @sides = [a, b, c].sort(sorter)
    throw "negative sides are illegal" if @sides.some (i) -> i <= 0
    throw "violation of triangle inequality" if @sides[0] + @sides[1] <= @sides[2]

  kind: () ->
    reducer = (pV, cV) ->
      [..., last] = pV
      pV.push(cV) unless last == cV
      pV

    switch @sides.reduce(reducer, []).length
      when 1 then 'equilateral'
      when 2 then 'isosceles'
      else 'scalene'

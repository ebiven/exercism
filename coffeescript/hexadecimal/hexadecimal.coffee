module.exports = class Hexadecimal
  constructor: (@value) ->

  toDecimal: () ->
    return 0 unless /^[a-f0-9]+$/.test @value
    reducer = (pV, cV, index) => pV + @toInteger(cV) * Math.pow(16, index)
    @value.split('').reverse().reduce(reducer, 0)

  toInteger: (v) ->
    switch v
      when 'a' then 10
      when 'b' then 11
      when 'c' then 12
      when 'd' then 13
      when 'e' then 14
      when 'f' then 15
      else parseInt(v, 10)

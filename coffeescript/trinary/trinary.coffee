module.exports = class Trinary
  constructor: (@value) ->

  toDecimal: () ->
    return 0 unless /^[012]+$/.test @value
    reducer = (pV, cV, index) -> pV + cV * Math.pow(3, index)
    @value.split('').reverse().reduce(reducer, 0)

module.exports = class Binary
  constructor: (@value) ->

  toDecimal: () ->
    return 0 unless /^[01]+$/.test @value
    reducer = (pV, cV, index) -> pV + cV * Math.pow(2, index)
    @value.split('').reverse().reduce(reducer, 0)

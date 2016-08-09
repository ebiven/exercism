module.exports = class Luhn
  constructor: (input) ->
    @input      = input
    @checkDigit = @getCheckDigit()
    @addends    = @getAddends()
    @checksum   = @getChecksum()
    @valid      = @getValid()

  getCheckDigit: () -> @input % 10

  getAddends: () ->
    out = []
    input = @input.toString()
    for x in [0..input.length-1]
      do (x) ->
        i = input.length - x - 1
        current = parseInt(input[x], 10)
        if (i + 1) % 2 == 0
          current *= 2
          current -= 9 if current > 10

        out.push(current)

    out

  getChecksum: () ->
    reducer = (p, c) -> p + c
    @getAddends(@input).reduce(reducer, 0)

  getValid: () ->
    @getChecksum(@input) % 10 == 0

  @create: (input) ->
    n = input + "0"
    checkDigit = new Luhn(n).checksum
    checkDigit = checkDigit % 10
    checkDigit = 10 - checkDigit if checkDigit != 0
    parseInt("#{input}#{checkDigit}", 10)

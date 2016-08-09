module.exports = class Palindromes
  constructor: (options) ->
    @maxFactor = options.maxFactor
    @minFactor = options.minFactor || 1
    @results = {}

  generate: () ->
    for x in [@minFactor..@maxFactor]
      for y in [x..@maxFactor]
        if @isPalindrome(x*y)
          if @results[x*y]
            @results[x*y].factors.push([x,y])
          else
            @results[x*y] = { value: x*y, factors: [[x,y]] }

  largest: () ->
    out = {value: 0}
    for k in Object.keys(@results)
      out = @results[k] if @results[k].value > out.value
    return out

  smallest: () ->
    out = {value: Number.MAX_VALUE}
    for k in Object.keys(@results)
      out = @results[k] if @results[k].value < out.value
    return out

  isPalindrome: (input) ->
    input = input.toString()
    input == input.split('').reverse().join('')

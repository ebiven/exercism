module.exports = class WordProblem
  constructor: (question) ->
    r = /\-?\d+|plus|minus|divided by|multiplied by/g
    @parts = []
    loop
      match = r.exec(question)
      break if match is null
      @parts.push(match[0])

  answer: () ->
    throw @ERROR.tooComplicated if @parts.length < 3 or @parts.length % 2 == 0

    out = parseInt(@parts[0], 10)
    for x in [1...@parts.length] by 2
      [op, r] = @parts.slice(x, x+2)
      r = parseInt(r, 10)
      switch op
        when 'plus' then out += r
        when 'minus' then out -= r
        when 'multiplied by' then out *= r
        when 'divided by' then out /= r

    out

  ERROR:
    tooComplicated: new Error("I don't understand the question")

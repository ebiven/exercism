module.exports = class Words
  constructor: (input) ->
    @words = input.toLowerCase().match(/\b[a-z0-9]+\b/g)

  count: () ->
    reducer = (acc, item) ->
      acc[item] = if acc[item] then acc[item] + 1 else 1
      acc

    @words.reduce reducer, {}

module.exports = class Bob
  isQuestion: () -> @saying.endsWith('?')
  isNothing:  () -> @saying.trim().length == 0
  isYelling:  () -> @saying.toUpperCase() == @saying && @saying.match(/[A-z]/)

  hey: (saying) ->
    @saying = saying
    return 'Fine. Be that way!' if @isNothing()
    return 'Whoa, chill out!' if @isYelling()
    return 'Sure.' if @isQuestion()
    return 'Whatever.'

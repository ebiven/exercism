module.exports = class Clock
  @at: (hours, minutes = 0) ->
    new Clock(hours, minutes)

  constructor: (hours, minutes) ->
    @minutes  = (hours * 60) + minutes

  hoursPart: () -> Math.floor(@minutes / 60 % 24)

  minutesPart: () -> @minutes % 60

  toString: () -> "#{@pad @hoursPart()}:#{@pad @minutesPart()}"

  plus: (minutes) ->
    @minutes += minutes
    @

  minus: (minutes) ->
    @minutes -= minutes
    # The math goes bad if our minutes go into the negative. Keep
    # adding days until we get past that.
    loop
      break if @minutes >= 0
      @minutes = (24 * 60) + @minutes
    @

  equals: (compareTo) -> @.toString() == compareTo.toString()

  pad: (n) -> if n > 9 then n.toString() else "0#{n}"

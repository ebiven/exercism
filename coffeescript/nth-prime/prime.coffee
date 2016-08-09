module.exports = class Prime
  @nth: (count) ->
    throw new Error 'Prime is not possible' if count < 1
    check = 0
    numFound = 0
    loop
      numFound += 1 if @checker(check)
      return check if numFound == count
      check += 1

  @checker: (n) ->
    return false if n <= 1
    return true  if n <= 3
    return false if n % 2 == 0 or n % 3 == 0
    @checker2(n, 5)

  @checker2: (n, i) ->
    return true  if i * i > n
    return false if n % i == 0
    return false if n % (i + 2) == 0
    @checker2(n, i + 6)

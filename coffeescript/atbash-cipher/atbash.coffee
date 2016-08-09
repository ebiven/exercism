module.exports = class Atbash
  @encode: (subject) ->
    key = @getKey()
    subject = subject.toLowerCase().replace(/[^a-z0-9]/, "")
    subject = (key[char] for char in subject.split('')).join('')

    i = 0
    for x in [5..subject.length] by 5
      subject = subject.slice(0, x+i) + " " + subject.slice(x+i)
      i += 1

    subject.trim()

  @getKey: () ->
    out      = {}
    forward  = "abcdefghijklmnopqrstuvwxyz0123456789"
    backward = "zyxwvutsrqponmlkjihgfedcba0123456789"

    for x in [0...forward.length]
      out[forward.charAt(x)] = backward.charAt(x)

    out

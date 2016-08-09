module.exports = class DNA
  constructor: (@strand) ->
    @nucleotideCounts = { 'A' : 0, 'T' : 0, 'C' : 0, 'G' : 0 }
    for n in @strand.split('')
      @nucleotideCounts[n] += 1

  count: (nucleotide) ->
    unless Object.keys(@nucleotideCounts).some((i) -> i == nucleotide)
      throw new Error 'Invalid Nucleotide'
    @nucleotideCounts[nucleotide]

class Alphametics
  # This feels a little hackish, and it's certainly brute force all the
  # way, but it works like a champ.
  def solve(input)
    # Sub in the power operator.
    input.gsub!(/ \^ /, '**')
    distinct_letters = input.gsub(/[^A-Z]/, '').chars.uniq

    # Get all the possible answer maps.
    options = (0..9).to_a
      .permutation(distinct_letters.length).to_a.map do |p|
        p.zip(distinct_letters).each_with_object({}) { |(i,l), a| a[l] = i }
      end

    # By selecting on them I could theoretically find bad puzzles that
    # have multiple valid answers
    out = options.select do |o|
      check = input.tr(o.keys.join, o.values.join)
      # Numbers can't start with a 0.
      next if check =~ /^0| 0\d/
      o if eval(check)
    end
    out[0]
  end
end

module BookKeeping
  VERSION = 2
end

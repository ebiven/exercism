class Alphametics
  # This feels a little hackish, and it's certainly brute force all the
  # way, but it works like a champ.
  def solve(input)
    input.freeze
    distinct_letters = input.gsub(/[^A-Z]/, '').chars.uniq

    # Get all the possible answer maps.
    options = []
    (0..9).to_a
      .combination(distinct_letters.length).to_a.each do |c|
        c.permutation do |p|
          option = (p.zip(distinct_letters).each_with_object({}) { |(i,l), a| a[l] = i } )
          options.push(option)
        end
      end

    # Check them one at a time.
    winner = nil
    options.each do |o|
      check = input.tr(o.keys.join, o.values.join)
      check.gsub!(/ \^ /, '**')
      next if check =~ /^0| 0\d/
      winner = o if eval(check)
    end
    winner
  end
end

module BookKeeping
  VERSION = 2
end

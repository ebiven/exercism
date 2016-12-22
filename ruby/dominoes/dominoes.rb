module Dominoes
  def self.chain(input)
    return input if input.empty?
    return nil if input.count == 1 && input.first.first != input.first.last

    output_chain = nil

    input.permutation { |chain|
      if valid_chain?(chain)
        output_chain = chain
        break
      end
    }

    output_chain
  end

  def self.valid_chain?(chain)
    # See if we can match the first and last dominoes with the dominoes in
    # either direction. If not this can't possibly be a chain.
    if chain.first.first == chain.last.last
      # Leave the first and last alone.
    elsif chain.first.first == chain.last.first
      # Flip the last.
      chain[chain.count - 1] = chain.last.reverse
    elsif chain.first.last == chain.last.last
      # Flip the first.
      chain[0] = chain.first.reverse
    elsif chain.first.last == chain.last.first
      # Gotta flip 'em all.
      chain[0] = chain.first.reverse
      chain[chain.count - 1] = chain.last.reverse
    else
      # We can't even match the ends, this won't work at all.
      return false
    end

    (1..chain.count - 1).each { |index|
      current = chain[index]
      prev = chain[index-1]

      if prev.last == current.first
        # These match, move on.
      elsif prev.last == current.last
        # Swap this current one around.
        chain[index] = current.reverse
      else
        # Can't make a match work.
        return false
      end
    }
  end
end

module BookKeeping
  VERSION = 1
end

class Change
  def self.generate(coins, amount)
    # Negative amounts won't work, guard against those.
    return -1 if amount < 0

    # Create an array of pennies so we can start replacing them. We'll deal
    # later with the fact that pennies may not be in our available coins.
    change = Array.new(amount, 1)

    # We will iterate through the available coins, replacing as many of the
    # current coins as possible with these newer, larger coins. We'll do this by
    # stepping through the `change` array, starting with the first item and
    # taking progressively more items until we either:
    # 1. Get a value match to our current coin, in which case we remove the
    #    now replaceable coins from the front of the array and append our new,
    #    larger replacement
    #    - or -
    # 2. The sum of the items is greater than the current coin in which case
    #    we slide one coin to the right and reset the window to its original
    #    size.
    coins.each do |coin|
      # Start with the first two items in the `change` array.
      position = 0
      items    = 2

      while true
        # If our window is hanging off the end then move on, we're done for
        # this coin size.
        break if position + items > change.length
        # Get the total value of the coins in our current window.
        total = change[position...position + items].reduce(:+)

        if total < coin
          # Open the window to get one more coin next time.
          items += 1

        elsif total == coin
          # We can remove the coins in the window and push this current
          # coin onto the end of our `change` array.
          change.reject!.with_index { |v, i| (position...position + items).include? i }
          change << coin
          # Start this whole thing again in case we can replace more of
          # the current `change` items with this coin.
          position = 0
          items    = 2

        else
          # Our total was too large, slide the window one position to the
          # right and reset the size.
          position += 1
          items     = 2
        end
      end
    end

    # Ensure all the coins in our change were available to us.
    return -1 unless change.all? { |v| coins.include? v }

    change
  end
end

module BookKeeping
  VERSION = 1
end

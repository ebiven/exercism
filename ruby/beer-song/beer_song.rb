class BeerSong
  def verse(number)
    phraseN(number)
  end

  def verses(start, stop)
    # Ranges won't work descending.
    start.downto(stop).collect { |n| verse(n) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  private

  def phraseN(n)
    return phrase0 if n == 0
    return phrase1 if n == 1
    "#{n} bottles of beer on the wall, #{n} bottles of beer.\nTake one down and pass it around, #{n - 1} bottle#{n - 1 == 1 ? '' : 's'} of beer on the wall.\n"
  end

  def phrase0
    "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def phrase1
    "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

module BookKeeping
  VERSION = 2
end

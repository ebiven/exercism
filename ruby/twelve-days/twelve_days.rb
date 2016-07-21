module TwelveDays
  def self.song
    "#{(1..@@parts.length).map { |i| verse(i) }.join("\n\n")}\n"
  end

  def self.verse(n)
    parts = ["On the #{@@number_words[n-1]} day of Christmas my true love gave to me"]
    if n == 1
      parts.push(@@parts.last(1)[0].slice(4, 99))
    else
      parts.push(@@parts.last(n))
    end
    parts.join(', ')
  end

  @@number_words = %w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)

  @@parts = [
    "twelve Drummers Drumming",
    "eleven Pipers Piping",
    "ten Lords-a-Leaping",
    "nine Ladies Dancing",
    "eight Maids-a-Milking",
    "seven Swans-a-Swimming",
    "six Geese-a-Laying",
    "five Gold Rings",
    "four Calling Birds",
    "three French Hens",
    "two Turtle Doves",
    "and a Partridge in a Pear Tree."
  ]

  #On the twelfth day of Christmas my true love gave to me, twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
end

module BookKeeping
  VERSION = 2
end

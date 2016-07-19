class Say
  def initialize(num)
    @num = num
  end

  def in_english
    raise ArgumentError if @num < 0 || @num > 999999999999

    # This is the only reason we would ever say 'zero'.
    return "zero" if @num == 0

    # Add commas for easy splitting later.
    parts = @num.to_s
    if @num > 100
      parts.gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
    end
    parts = parts
      .split(',') # Split it into groups of three.
      .map(&:to_i) # Parse as ints.
      .reverse.zip(@@suffixes).reverse # Get suffixes for each group.
      .each_with_object([]) do |(num, suffix), acc|
        # If this parsed as 0 we say nothing for this group.
        next if num == 0

        # Get the hundreds part of the number.
        hundreds = (num/100).floor
        if hundreds > 0
          acc.push(say_ones(hundreds))
          acc.push('hundred')
          num -= hundreds * 100
        end

        # Get the tens part of the number.
        tens = (num/10).floor
        # If tens is less than twenty then say_ones handles it.
        if tens > 1
          acc.push(say_tens(tens * 10))
          num -= tens * 10
          # Hyphenate between the tens and ones part.
          acc.push('-') if num > 0
        end

        acc.push(say_ones(num))
        acc.push(suffix)
      end

    # We wind up with some extra spaces, get rid of those.
    parts.join(' ').strip.gsub(/ - /, '-').gsub(/  /, ' ')
  end

  private

  def say_tens(input)
    @@tens.fetch(input) { '' }
  end

  def say_ones(input)
    @@numerals.fetch(input) { '' }
  end

  @@numerals = {
    19 => 'nineteen',
    18 => 'eighteen',
    17 => 'seventeen',
    16 => 'sixteen',
    15 => 'fifteen',
    14 => 'fourteen',
    13 => 'thirteen',
    12 => 'twelve',
    11 => 'eleven',
    10 => 'ten',
     9 => 'nine',
     8 => 'eight',
     7 => 'seven',
     6 => 'six',
     5 => 'five',
     4 => 'four',
     3 => 'three',
     2 => 'two',
     1 => 'one'
  }

  @@tens = {
    100 => 'hundred',
     90 => 'ninety',
     80 => 'eighty',
     70 => 'seventy',
     60 => 'sixty',
     50 => 'fifty',
     40 => 'forty',
     30 => 'thirty',
     20 => 'twenty'
  }

  @@suffixes = [
    '',
    'thousand',
    'million',
    'billion',
  ];
end

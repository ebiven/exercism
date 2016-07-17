class Fixnum
  def to_roman
    i = self
    s = ''
    map.each do |a, r|
      s += r*(i/a)
      i = i % a
    end
    s
  end

  def map
    {
      1000 => 'M',
      900  => 'CM',
      500  => 'D',
      400  => 'CD',
      100  => 'C',
      90   => 'XC',
      50   => 'L',
      40   => 'XL',
      10   => 'X',
      9    => 'IX',
      5    => 'V',
      4    => 'IV',
      1    => 'I'
    }
  end
end

module BookKeeping
  VERSION = 2
end

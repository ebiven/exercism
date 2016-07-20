class Luhn
  def initialize(number)
    @number = number
  end

  def addends
    out = []
    @number.to_s.chars.map(&:to_i).each_with_index do |l, x|
      i = @number.to_s.length - x
      if i % 2 == 0
        l *= 2
        l -=9 if l > 10
      end
      out.push(l)
    end
    out
  end

  def checksum
    addends.inject(0, :+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    n = number.to_s + "0"
    check_digit = self.new(n).checksum % 10
    check_digit = 10 - check_digit if check_digit != 0
    number * 10 + check_digit
  end
end


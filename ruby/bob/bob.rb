class Bob
  def hey(text)
    r = Remark.new(text)
    case
    when r.yelling?
      'Whoa, chill out!'
    when r.question?
      'Sure.'
    when r.nothing?
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end

class Remark
  def initialize(text)
    @text = text
  end

  def question?
    @text.end_with?('?')
  end

  def yelling?
    @text.upcase == @text && @text =~ /[A-Z]/
  end

  def nothing?
    @text.to_s.strip.empty?
  end
end

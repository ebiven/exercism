class Game
  def initialize
    @game = []
  end

  def roll(pins)
    if @game.length == 10 && @game.last.complete? && !(@game.last.strike? || @game.last.spare?)
      raise 'Should not be able to roll after game is over'
    end
    @game.push(Frame.new) if @game.length == 0 || @game.last.complete?
    currentFrame = @game.last
    currentFrame.add(pins)
  end

  def score
    if (@game.length < 10) ||
       (@game.length == 10 && !@game.last.complete?) ||
       (@game.length == 10 && @game.last.strike?)
      raise 'Score cannot be taken until the end of the game'
    end
    score = 0
    @game.each_with_index do |f, i|
      return score if i > 9
      score += f.score
      score += sum_of_next_rolls(i, 2) if f.strike?
      score += sum_of_next_rolls(i, 1) if f.spare?
    end
    score
  end

  def sum_of_next_rolls(start_index, number)
    out = 0
    next_frame      = @game[start_index+1]
    following_frame = @game[start_index+2]
    if number == 1
      out += next_frame.first
    else
      out += next_frame.first
      if next_frame.second
        out += next_frame.second
      else
        out += following_frame.first
      end
    end
    out
  end
end

class Frame
  attr_reader :first, :second

  def initialize
    @first  = nil
    @second = nil
  end

  def add(pins)
    raise 'Pins must have a value from 0 to 10' if pins < 0 || pins > 10
    if @first == nil
      @first = pins
    else
      @second = pins
    end
    raise 'Pin count exceeds pins on the lane' if score > 10
  end

  def complete?
    @first == 10 || @first != nil && @second != nil
  end

  def strike?
    @first == 10
  end

  def spare?
    @second != nil && @first + @second == 10
  end

  def score
    @first + (@second || 0)
  end

  def to_s
    "#{@first}, #{@second}, #{score}"
  end
end

module BookKeeping
  VERSION = 1
end

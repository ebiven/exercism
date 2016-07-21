class Poker
  attr_reader :best_hand

  def initialize(hands)
    hands = hands.map { |h| Hand.new(h) }
    @best_hand = hands
      .select { |h| h.score == hands.max.score }
      .map { |h| h.cards }
  end
end

class Hand
  include Comparable
  attr_reader :score, :cards

  def initialize(cards)
    @cards   = cards
    @numbers = []
    @suits   = []

    cards.map do |card|
      card = card.chars
      case card[0]
      when 'A' then card[0] = 14
      when 'K' then card[0] = 13
      when 'Q' then card[0] = 12
      when 'J' then card[0] = 11
      when 'J' then card[0] = 11
      when 'T' then card[0] = 10 # Tens don't exist.
      end
      @numbers.push(card.first.to_i)
      @suits.push(card.last)
    end

    @number_count = @numbers.each_with_object(Hash.new(0)) { |i, acc| acc[i] += 1 }
    score_hand
  end

  def score_hand
    score   = 0
    # Royal flush. Can't happen because no tens.
    if flush? && @numbers.min > 9 then score = 1000
    elsif flush? && straight?     then score = 900 + flush?
    elsif t = four_of_a_kind?     then score = 800 + t
    elsif t = full_house?         then score = 700 + t
    elsif t = flush?              then score = 600 + t
    elsif t = straight?           then score = 500 + t
    elsif t = three_of_a_kind?    then score = 400 + t
    elsif t = two_pairs?          then score = 300 + t
    elsif t = pair?               then score = 200 + t
    else                               score = high_card
    end
    @score = score
  end

  def flush?
    (@suits.uniq.length == 1) ? @numbers.max : false
  end

  def straight?
    normal = @numbers.uniq.length == 5 && @numbers.max - @numbers.min == 4
    ace_high = @numbers.sort.eql?([2, 3, 4, 5, 14])
    (normal || ace_high) ? @numbers.max : false
  end

  def four_of_a_kind?
    out = false
    @number_count.each_pair { |(k,v)| out = k if  v == 4 }
    out
  end

  def full_house?
    over  = false
    under = false
    @number_count.each_pair { |(k,v)| over  = k if  v == 3 }
    @number_count.each_pair { |(k,v)| under = k if  v == 2 }
    return false unless over && under
    over * 10 + under
  end

  def three_of_a_kind?
    over  = false
    under = false
    @number_count.each_pair { |(k,v)| over  = k if  v == 3 }
    @number_count.each_pair { |(k,v)| under = k if  v == 2 }
    return false unless over && !under
    over * 10 + @numbers.select { |n| n != over }.max
  end

  def two_pairs?
    return false unless @number_count.values.sort.eql?([1,2,2])
    high = 0
    @number_count.each_pair { |(k,v)| high = k if k > high && v == 2 }
    high
  end

  def pair?
    return false unless @number_count.values.sort.eql?([1,1,1,2])
    high = 0
    @number_count.each_pair { |(k,v)| high = k if v == 2 }
    high
  end

  def high_card
    return @numbers.max
  end

  def <=>(other)
    @score <=> other.score
  end
end

module BookKeeping
  VERSION = 1
end

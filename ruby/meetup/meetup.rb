class Meetup
  def initialize(month, year)
    @cal = (Date.new(year, month, 1)..Date.new(year, month, -1))
  end

  def day(dow, schedule)
    all_dows = @cal.select { |date| date.send("#{dow}?") }
    case schedule
    when :first  then all_dows[0]
    when :second then all_dows[1]
    when :third  then all_dows[2]
    when :fourth then all_dows[3]
    when :last   then all_dows.last
    when :teenth
      all_dows.select { |d| d.mday > 12 && d.mday < 20 }.first
    end
  end
end

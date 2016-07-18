class Clock
  def self.at(hour, minute)
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    @minutes = hour * 60 + minute
  end

  def +(hour=0, minute)
    @minutes += hour * 60 + minute
    self
  end

  def ==(clock2)
    to_s == clock2.to_s
  end

  def hour_part
    @minutes / 60 % 24
  end

  def minute_part
    @minutes % 60
  end

  def to_s
    "#{hour_part.to_s.rjust(2, '0')}:#{minute_part.to_s.rjust(2, '0')}"
  end
end

module BookKeeping
  VERSION = 2
end

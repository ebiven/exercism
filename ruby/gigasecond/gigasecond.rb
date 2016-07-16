module BookKeeping
  VERSION = 3
end

class Gigasecond
  def self.from(start)
    start + 10**9
  end
end

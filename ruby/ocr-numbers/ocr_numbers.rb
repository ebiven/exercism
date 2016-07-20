class OCR
  @value = nil

  def initialize(value)
    @value = value
  end

  def convert
    digits = []
    @value.lines.each_slice(4).map do |row|
      row = row.first(3)
      row.map! { |r| r.tr("\n", " ") }
      (0..row.first.length).step(3).map do |col|
        parts = row.map { |part| part.slice(col, 3) }
        if parts.any? { |p| p.strip != "" }
          parts.map! { |o| (o.length == 2) ? "#{o} " : o }
          parts.map! { |o| (o.length <  2) ? "   "   : o }
          digits.push @@numbers.fetch(parts) { '?' }
        end
      end
      digits.push(',')
    end
    digits.join.gsub(/,$/, '')
  end

  @@numbers = {
    [' _ ', '| |', '|_|'] => '0',
    ['   ', '  |', '  |'] => '1',
    [' _ ', ' _|', '|_ '] => '2',
    [' _ ', ' _|', ' _|'] => '3',
    ['   ', '|_|', '  |'] => '4',
    [' _ ', '|_ ', ' _|'] => '5',
    [' _ ', '|_ ', '|_|'] => '6',
    [' _ ', '  |', '  |'] => '7',
    [' _ ', '|_|', '|_|'] => '8',
    [' _ ', '|_|', ' _|'] => '9'
  }
end

class PhoneNumber
  def initialize(raw)
    r = raw.gsub(/[ ()\.-]/, '').match(/^1?(\d{3})(\d{3})(\d{4})$/)
    if r
      @area_code   = r.captures[0]
      @office_code = r.captures[1]
      @extension   = r.captures[2]
    else
      @area_code   = '000'
      @office_code = '000'
      @extension   = '0000'
    end
    @parsed = @area_code + @office_code + @extension
  end

  def number
    @parsed
  end

  def area_code
    @area_code
  end

  def to_s
    "(#{@area_code}) #{@office_code}-#{@extension}"
  end
end

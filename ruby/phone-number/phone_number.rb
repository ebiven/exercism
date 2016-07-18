class PhoneNumber
  attr_reader :area_code, :office_code, :extension, :number

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
    @number = @area_code + @office_code + @extension
  end

  def to_s
    "(#{@area_code}) #{@office_code}-#{@extension}"
  end
end

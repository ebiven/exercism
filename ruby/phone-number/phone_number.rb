class PhoneNumber
  attr_reader :area_code, :office_code, :extension, :number

  def initialize(raw)
    r = raw.gsub(/[ ()\.-]/, '').match(/^1?(\d{3})(\d{3})(\d{4})$/)
    @area_code   = r ? r.captures[0] : '000'
    @office_code = r ? r.captures[1] : '000'
    @extension   = r ? r.captures[2] : '0000'
    @number = @area_code + @office_code + @extension
  end

  def to_s
    "(#{@area_code}) #{@office_code}-#{@extension}"
  end
end

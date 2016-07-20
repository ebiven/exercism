class Cipher
  attr_reader :key

  def initialize(key=false)
    raise ArgumentError unless key == false || key =~ /^[a-z]+$/
    @key = key || random_key
  end

  def random_key
    ('a'..'z').to_a.sample(256).join
  end

  def encode(input)
    out = []
    kb  = get_bytes(@key)
    get_bytes(input).each_with_index do |c, i|
      out.push (c + kb[i % kb.length]) % 26
    end
    get_string(out)
  end

  def decode(input)
    out = []
    kb  = get_bytes(@key)
    get_bytes(input).each_with_index do |c, i|
      out.push (c - kb[i % kb.length]) % 26
    end
    get_string(out)
  end

  def get_bytes(input)
    input.unpack('c*').map { |i| i - 97 }
  end

  def get_string(input)
    input.map { |i| i + 97 }.pack('c*')
  end
end

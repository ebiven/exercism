class Crypto
  def initialize(input)
    @input = input
  end

  def normalize_plaintext
    @input.downcase.gsub(/[^a-z0-9]/, '')
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).collect { |i| i.join }.to_a
  end

  def normalize_ciphertext
    transpose.join(' ')
  end

  def ciphertext
    transpose.join
  end

  private

  def transpose
    segs = plaintext_segments.map { |i| Array.new(size) { |j| i[j] or '' } }
    segs.transpose.map { |i| i.join }
  end
end

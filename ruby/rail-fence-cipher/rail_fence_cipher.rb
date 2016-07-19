class RailFenceCipher
  VERSION = 1

  def self.encode(message, rails)
    f  = fence(message, rails)
    fm = fence_map(rails)
    message.chars.each_with_index { |c, i| f[fm[i%fm.length]][i] = c }
    f.map { |i| i.join }.join
  end

  def self.decode(message, rails)
    f  = fence(message, rails)
    fm = fence_map(rails)
    (0..message.length-1).each_with_index { |c, i| f[fm[i%fm.length]][i] = c }
    f = f.map { |i| i.compact }
    f = f.each_with_object([]) { |i, acc| acc.concat(i) }
    out = ''
    (0..message.length-1).each { |i| out += message[f.find_index(i)] }
    out
  end

  def self.fence(message, rails)
    Array.new(rails) { Array.new(message.length) }
  end

  def self.fence_map(rails)
    0.upto(rails-1).to_a.concat((rails-2).downto(1).to_a)
  end
end

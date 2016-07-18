class Array
  def keep
    out = []
    each { |i| out.push(i) if yield(i) }
    out
  end

  def discard
    out = []
    each { |i| out.push(i) unless yield(i) }
    out
  end
end

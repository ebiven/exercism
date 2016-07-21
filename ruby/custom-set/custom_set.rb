class CustomSet
  attr_reader :set

  def initialize(set)
    @set = set
  end

  def empty?
    @set.empty?
  end

  def member?(item)
    @set.include?(item)
  end

  def subset?(other)
    @set.all? { |i| other.set.any? { |j| j.eql?(i) } }
  end

  def disjoint?(other)
    intersection(other).empty?
  end

  def intersection(other)
    CustomSet.new(@set.select { |i| other.member?(i) })
  end

  def difference(other)
    CustomSet.new(@set.select { |i| !other.member?(i) })
  end

  def union(other)
    out = CustomSet.new(@set)
    other.set.each { |i| out.add(i) }
    out
  end

  def ==(other)
    size == other.size && subset?(other)
  end

  def size
    @set.length
  end

  def add(item)
    @set.push(item).uniq!
    self
  end
end

module BookKeeping
  VERSION = 1
end

class SimpleLinkedList
  attr_reader :head, :size

  def initialize
    @size = 0
  end

  def push(datum)
    @size += 1
    @head = Element.new(datum, @head)
  end

  def peek
    (@head) ? @head.datum : nil
  end

  def pop
    @size -= 1
    # It feels like Ruby should have an analogue for Elixir's
    # `get_and_update/3` but I couldn't find it.
    out = @head.datum
    @head = @head.next
    out
  end

  def empty?
    @size == 0
  end

  def reverse
    each.with_object(SimpleLinkedList.new) { |i, acc| acc.push(i) }
  end

  def to_a
    each.to_a
  end

  def each
    return enum_for(:each) unless block_given?
    n = @head
    until n.nil?
      yield n.datum
      n = n.next
    end
  end

  def self.from_a(items)
    items = [] unless items.is_a? Array
    items.reverse.each_with_object(new) { |i, list| list.push(i) }
  end
end

class Element
  attr_reader :datum, :next

  def initialize(datum, n=nil)
    @datum = datum
    @next  = n
  end

  def tail?
    @next == nil
  end
end

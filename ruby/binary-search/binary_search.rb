class BinarySearch
  def initialize(items)
    raise ArgumentError unless items == items.sort
    @list = (0..items.length-1).zip(items)
  end

  def list
    @list.map { |i| i.last }
  end

  def search_for(item)
    search(item).first
  end

  def middle
    (@list.length/2).floor
  end

  private

  def search(item)
    # Copy the list so we can mutate it later.
    list = @list.slice(0..@list.length-1)
    mid_point = (list.length/2).floor
    mid_item = list[mid_point]
    while mid_item != nil do
      return mid_item if mid_item.last == item
      list      = list.slice(0..mid_point-1)           if mid_item.last > item
      list      = list.slice(mid_point+1..list.length) if mid_item.last < item
      mid_point = (list.length/2).floor
      mid_item  = list[mid_point]
    end
    raise RuntimeError
  end
end

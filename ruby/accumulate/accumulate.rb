class Array
  def accumulate
    # This could be an accumulator array having a value pushed on
    # in an `each`, but everything is a pretty thin wrapper around
    # map.
    map { |i| yield(i) }
  end
end

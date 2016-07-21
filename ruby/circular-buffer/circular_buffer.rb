class CircularBuffer
  def initialize(capacity)
    @capacity = capacity
    clear
  end

  def read
    raise BufferEmptyException if empty?
    out = @buffer[@read_position]
    @buffer[@read_position] = nil
    change_read_position
    out
  end

  def write(value)
    raise BufferFullException if full?
    @buffer[@write_position] = value
    change_write_position
  end

  def write!(value)
    change_read_position if full?
    @buffer[@write_position] = value
    change_write_position
  end

  def clear
    @read_position  = 0
    @write_position = 0
    @buffer         = Array.new(@capacity, nil)
  end

  class BufferEmptyException < Exception; end
  class BufferFullException  < Exception; end

  private

  def empty?
    @buffer.compact.empty?
  end

  def full?
    @buffer.all?
  end

  def change_read_position
    @read_position = (@read_position + 1) % @capacity
  end

  def change_write_position
    @write_position = (@write_position + 1) % @capacity
  end
end

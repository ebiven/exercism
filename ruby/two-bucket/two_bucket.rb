class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(size_one, size_two, goal, starting)
    @moves        = 1
    @goal         = goal
    @goal_bucket  = ""
    @other_bucket = 0
    bucket_one    = Bucket.new(size_one, 'one')
    bucket_two    = Bucket.new(size_two, 'two')

    case starting
    when 'one'
      bucket_one.fill
      start(bucket_one, bucket_two)
    when 'two'
      bucket_two.fill
      start(bucket_two, bucket_one)
    end
  end

  private

  # bucket_one and bucket_two are not the same here as above. Start
  # swaps them based on which one starts filled.
  def start(bucket_one, bucket_two)
    99.times do
      break if complete?(bucket_one, bucket_two)

      if @moves == 1 then bucket_one.pour(bucket_two)
      elsif bucket_one.empty? then bucket_one.fill
      elsif bucket_one.full? && bucket_two.part_full? then bucket_one.pour(bucket_two)
      elsif bucket_two.full? then bucket_two.empty
      elsif bucket_two.empty? && bucket_one.part_full? then bucket_one.pour(bucket_two)
      end
      @moves += 1
    end
  end

  def complete?(bucket_one, bucket_two)
    if bucket_one.contains == @goal
      @goal_bucket = bucket_one.id
      @other_bucket = bucket_two.contains
      return true
    elsif bucket_two.contains == @goal
      @goal_bucket = bucket_two.id
      @other_bucket = bucket_one.contains
      return true
    end
    false
  end
end

class Bucket
  attr_reader :id, :size
  attr_accessor :contains

  def initialize(size, id)
    @size     = size
    @id       = id
    @contains = 0
  end

  def fill
    @contains = @size
  end

  def empty
    @contains = 0
  end

  def full?
    @contains == @size
  end

  def part_full?
    @contains > 0 && @contains != @size
  end

  def empty?
    @contains == 0
  end

  def pour(target)
    amount_to_transfer = [target.size - target.contains, @contains].min
    target.contains += amount_to_transfer
    @contains -= amount_to_transfer
  end
end

module BookKeeping
  VERSION = 2
end

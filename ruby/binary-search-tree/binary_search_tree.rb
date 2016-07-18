class Bst
  attr_reader :data, :left, :right
  def initialize(value)
    @data  = value
    @left  = nil
    @right = nil
  end

  def insert(value)
    if value <= @data
      @left.insert(value) if @left != nil
      @left = Bst.new(value) if @left == nil
    else
      @right.insert(value) if @right != nil
      @right = Bst.new(value) if @right == nil
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?
    left.each(&block) if @left
    yield(@data)
    right.each(&block) if @right
  end
end

module BookKeeping
  Bst::VERSION = 1
end

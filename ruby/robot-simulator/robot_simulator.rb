class Simulator
  def instructions(input)
    @instructions = input.chars.map { |i|
      case i
      when 'A' then :advance
      when 'R' then :turn_right
      when 'L' then :turn_left
      end
    }
    @instructions
  end

  def place(robot, x: 0, y: 0, direction: :north)
    robot.orient(direction)
    robot.at(x, y)
    @robot = robot
  end

  def evaluate(robot, input)
    instructions(input).each { |i| robot.send(i) }
  end
end

class Robot
  attr_reader :coordinates

  def orient(direction)
    raise ArgumentError unless @@bearings.keys.any? { |i| i == direction }
    @bearing = @@bearings[direction]
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def bearing
    @bearing[:n]
  end

  def turn_right
    @bearing = @@bearings[@bearing[:r]]
  end

  def turn_left
    @bearing = @@bearings[@bearing[:l]]
  end

  def advance
    x = @coordinates.first
    y = @coordinates.last
    @coordinates = @bearing[:a][x, y]
  end

  @@bearings = {
    north: { a: lambda{|x,y| [x,y+1]}, n: :north, l: :west,  r: :east  },
    east:  { a: lambda{|x,y| [x+1,y]}, n: :east,  l: :north, r: :south },
    south: { a: lambda{|x,y| [x,y-1]}, n: :south, l: :east,  r: :west  },
    west:  { a: lambda{|x,y| [x-1,y]}, n: :west,  l: :south, r: :north }
  }
end

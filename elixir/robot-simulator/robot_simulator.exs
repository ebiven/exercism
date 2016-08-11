defmodule RobotSimulator do
  defstruct direction: nil, position: nil

  @directions [:north, :east, :south, :west]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: { integer, integer }) :: any
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, {x, y}=position) when is_integer(x) and is_integer(y) do
    cond do
      direction in @directions ->
        %RobotSimulator{ direction: direction, position: position }

      true ->
        {:error, "invalid direction"}
    end
  end

  def create(_direction, _postition), do: {:error, "invalid position"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t ) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.graphemes
    |> Enum.reduce(robot, &move/2)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%RobotSimulator{direction: d}), do: d

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec position(robot :: any) :: { integer, integer }
  def position(%RobotSimulator{position: p}), do: p

  defp move("A", %RobotSimulator{direction: :north, position: {x, y}}=robot), do: %RobotSimulator{robot | position: {x, y+1}}
  defp move("A", %RobotSimulator{direction: :east,  position: {x, y}}=robot), do: %RobotSimulator{robot | position: {x+1, y}}
  defp move("A", %RobotSimulator{direction: :south, position: {x, y}}=robot), do: %RobotSimulator{robot | position: {x, y-1}}
  defp move("A", %RobotSimulator{direction: :west,  position: {x, y}}=robot), do: %RobotSimulator{robot | position: {x-1, y}}

  defp move("L", %RobotSimulator{direction: :north}=robot), do: %RobotSimulator{robot | direction: :west}
  defp move("L", %RobotSimulator{direction: :east }=robot), do: %RobotSimulator{robot | direction: :north}
  defp move("L", %RobotSimulator{direction: :south}=robot), do: %RobotSimulator{robot | direction: :east}
  defp move("L", %RobotSimulator{direction: :west }=robot), do: %RobotSimulator{robot | direction: :south}

  defp move("R", %RobotSimulator{direction: :north}=robot), do: %RobotSimulator{robot | direction: :east}
  defp move("R", %RobotSimulator{direction: :east }=robot), do: %RobotSimulator{robot | direction: :south}
  defp move("R", %RobotSimulator{direction: :south}=robot), do: %RobotSimulator{robot | direction: :west}
  defp move("R", %RobotSimulator{direction: :west }=robot), do: %RobotSimulator{robot | direction: :north}

  defp move(_command, _robot), do: {:error, "invalid instruction"}
end

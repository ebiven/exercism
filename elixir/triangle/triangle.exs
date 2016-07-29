defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @positive_error {:error, "all side lengths must be positive"}
  @inequality_error {:error, "side lengths violate triangle inequality"}

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }

  def kind(a, b, c) do
    [x, y, z] = Enum.sort([a, b, c])
    cond do
      x <= 0           -> @positive_error
      x + y <= z       -> @inequality_error
      x == z           -> {:ok, :equilateral}
      x == y || y == z -> {:ok, :isosceles}
      true             -> {:ok, :scalene}
    end
  end
end

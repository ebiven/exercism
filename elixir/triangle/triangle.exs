defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @positive_error {:error, "all side lengths must be positive"}
  @inequality_error {:error, "side lengths violate triangle inequality"}

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }

  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0, do: @positive_error

  def kind(a, b, c) when a + b <= c, do: @inequality_error
  def kind(a, b, c) when b + c <= a, do: @inequality_error
  def kind(a, b, c) when c + a <= b, do: @inequality_error

  def kind(a, a, a), do: {:ok, :equilateral}

  def kind(a, a, _), do: {:ok, :isosceles}
  def kind(a, _, a), do: {:ok, :isosceles}
  def kind(_, a, a), do: {:ok, :isosceles}

  def kind(_, _, _), do: {:ok, :scalene}
end

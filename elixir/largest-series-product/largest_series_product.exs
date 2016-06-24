defmodule Series do
  require Integer

  @doc """
  Finds the largest product of a given number of consecutive numbers in a given string of numbers.
  """
  @spec largest_product(String.t, non_neg_integer) :: non_neg_integer
  def largest_product(_, 0), do: 1
  def largest_product(number_string, size) do
    if size < 0, do: raise ArgumentError
    if String.length(number_string) < size, do: raise ArgumentError

    number_string
    |> String.codepoints
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk(size, 1)
    |> Enum.map(&(Enum.reduce(&1, 1, fn x, acc -> acc * x end)))
    |> Enum.max
  end
end

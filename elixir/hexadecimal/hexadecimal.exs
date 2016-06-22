defmodule Hexadecimal do
  @doc """
    Accept a string representing a hexadecimal value and returns the
    corresponding decimal value.
    It returns the integer 0 if the hexadecimal is invalid.
    Otherwise returns an integer representing the decimal value.

    ## Examples

      iex> Hexadecimal.to_decimal("invalid")
      0

      iex> Hexadecimal.to_decimal("af")
      175

  """

  @spec to_decimal(binary) :: integer
  def to_decimal(hex) do
    case String.match?(hex, ~r/[^0-9a-f]/i) do
      true -> 0
      _    ->
        hex
        |> String.downcase
        |> String.graphemes
        |> Enum.reverse
        |> do_calc
    end
  end

  defp do_calc(list), do: do_calc(list, 0, 0)
  defp do_calc([], acc, _position), do: acc
  defp do_calc([head|tail], acc, position) do
    item_value = get_integer(head) * (round :math.pow(16, position))
    do_calc(tail, acc + item_value, position + 1)
  end

  defp get_integer(i) do
    cond do
      i == "a" -> 10
      i == "b" -> 11
      i == "c" -> 12
      i == "d" -> 13
      i == "e" -> 14
      i == "f" -> 15
      true     -> String.to_integer i
    end
  end
end

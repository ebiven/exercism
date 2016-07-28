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
    case String.match?(hex, ~r/^[0-9a-f]+$/i) do
      true ->
        hex
        |> String.downcase
        |> String.codepoints
        |> Enum.reverse
        |> Enum.with_index
        |> Enum.reduce(0, &do_decimal/2)

      _ -> 0
    end
  end

  defp do_decimal({n, i}, acc) do
    acc + get_integer(n) * round(:math.pow(16, i))
  end

  defp get_integer(n) do
    cond do
      n == "a" -> 10
      n == "b" -> 11
      n == "c" -> 12
      n == "d" -> 13
      n == "e" -> 14
      n == "f" -> 15
      true     -> String.to_integer n
    end
  end
end

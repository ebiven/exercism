defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    case String.match?(string, ~r/^[01]+$/) do
      true ->
        string
        |> String.codepoints
        |> Enum.map(&String.to_integer/1)
        |> do_decimal
        |> round

      _ -> 0
    end
  end

  defp do_decimal([]), do: 0
  defp do_decimal([head|tail]) do
    head * :math.pow(2, Enum.count(tail)) + do_decimal(tail)
  end
end

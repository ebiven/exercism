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
        |> Enum.reverse
        |> Enum.with_index
        |> Enum.reduce(0, &do_decimal/2)

      _ -> 0
    end
  end

  defp do_decimal({n, i}, acc) do
    acc + String.to_integer(n) * round(:math.pow(2, i))
  end
end

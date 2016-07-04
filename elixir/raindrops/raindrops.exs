defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(1), do: "1"
  def convert(number) do
    out = do_convert(number, 3, "Pling") <>
          do_convert(number, 5, "Plang") <>
          do_convert(number, 7, "Plong")

    if String.length(out) > 0 do
      out
    else
      "#{number}"
    end
  end

  defp do_convert(n, b, s) when rem(n, b) == 0, do: s
  defp do_convert(_, _, _), do: ""
end

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
    out = ""
    factors = factors_for(number)
    if Enum.any?(factors, &(&1 == 3)), do: out = out <> "Pling"
    if Enum.any?(factors, &(&1 == 5)), do: out = out <> "Plang"
    if Enum.any?(factors, &(&1 == 7)), do: out = out <> "Plong"
    if String.length(out) == 0,        do: out = "#{number}"
    out
  end

  defp factors_for(1), do: []
  defp factors_for(number) do
    number
    |> do_factors(2, [])
    |> Enum.reverse
  end

  defp do_factors(1, _, acc), do: acc
  defp do_factors(number, divisor, acc) do
    remainder = rem(number, divisor)
    division = div(number, divisor)
    case remainder do
      0 -> do_factors(division, divisor, [divisor|acc])
      _ -> do_factors(number, divisor + 1, acc)
    end
  end
end

defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1), do: []
  def factors_for(number) do
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

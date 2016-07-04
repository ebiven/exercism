defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count < 1, do: raise ArgumentError
  def nth(count) when count < 1_000 do
    get_primes(count, 0, [])
  end
  def nth(_), do: "Stop it"

  defp get_primes(count, check, acc) do
    acc = case prime?(check) do
      true -> acc ++ [check]
      _    -> acc
    end
    if Enum.count(acc) == count do
      check
    else
      get_primes(count, check + 1, acc)
    end
  end

  # Naive prime checker: https://en.wikipedia.org/wiki/Primality_test
  defp prime?(n) do
    cond do
      n <= 1         -> false
      n <= 3         -> true
      rem(n, 2) == 0 -> false
      rem(n, 3) == 0 -> false
      true           -> prime?(n, 5)
    end
  end

  defp prime?(n, i) do
    cond do
      i * i > n          -> true
      rem(n, i) == 0     -> false
      rem(n, i + 2) == 0 -> false
      true               -> prime?(n, i + 6)
    end
  end
end

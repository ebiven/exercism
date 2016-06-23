defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) when limit < 2, do: []
  def primes_to(limit) do
    list = 2..limit
    Enum.reduce(list, list, &(drop_muliples_of(&2, &1)))
  end

  defp drop_muliples_of(values, p) do
    Enum.reject(values, &(rem(&1, p) == 0 && &1 > p))
  end
end

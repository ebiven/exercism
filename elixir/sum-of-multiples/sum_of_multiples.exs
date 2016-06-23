defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Enum.sum(for i <- 1..limit-1, Enum.any?(factors, &(rem(i,&1)==0)), do: i)
  end
end

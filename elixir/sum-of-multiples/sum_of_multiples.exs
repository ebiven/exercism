defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(1, _), do: 0
  def to(limit, factors) do
    do_to(limit - 1, factors)
  end

  defp do_to(1, _), do: 0
  defp do_to(item, factors) do
    case Enum.any?(factors, &(rem(item, &1) == 0)) do
      true -> item + do_to(item - 1, factors)
      _    -> do_to(item - 1, factors)
    end
  end
end

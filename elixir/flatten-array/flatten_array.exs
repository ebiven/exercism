defmodule Flattener do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> Flattener.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> Flattener.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    do_flatten([], list)
  end

  defp do_flatten(acc, [head|tail]) when is_list(head) do
    do_flatten(do_flatten(acc, tail), head)
  end

  defp do_flatten(acc, [nil|tail]) do
     do_flatten(acc, tail)
  end

  defp do_flatten(acc, [head|tail]) do
    [head|do_flatten(acc, tail)]
  end

  defp do_flatten(acc, []), do: acc
end

defmodule BinarySearch do
  @doc """
    Searches for a key in the list using the binary search algorithm.
    It returns :not_found if the key is not in the list.
    Otherwise returns the tuple {:ok, index}.

    ## Examples

      iex> BinarySearch.search([], 2)
      :not_found

      iex> BinarySearch.search([1, 3, 5], 2)
      :not_found

      iex> BinarySearch.search([1, 3, 5], 5)
      {:ok, 2}

  """

  @spec search(Enumerable.t, integer) :: {:ok, integer} | :not_found
  def search(list, key) do
    unless list == Enum.sort(list), do: raise ArgumentError, "expected list to be sorted"
    do_search(Enum.with_index(list), key)
  end

  defp do_search([], _), do: :not_found
  defp do_search(list, key) do
    {l, r} = Enum.split(list, div(length(list), 2))
    {[{item, index}], r} = Enum.split(r, 1)
    cond do
      item == key -> {:ok, index}
      item >  key -> do_search(l, key)
      true        -> do_search(r, key)
    end
  end
end

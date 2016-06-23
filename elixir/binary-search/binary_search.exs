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
    mid_point = (Enum.count(list) - 1) / 2 |> round
    {mid_item, mid_index} = Enum.at(list, mid_point)
    cond do
      mid_item == key -> {:ok, mid_index}
      mid_item >  key -> do_search(Enum.slice(list, 0, mid_point), key)
      true            -> do_search(Enum.slice(list, mid_point + 1, Enum.count(list)), key)
    end
  end
end

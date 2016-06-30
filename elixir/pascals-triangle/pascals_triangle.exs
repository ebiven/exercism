defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num) do
    do_row(1, num)
  end

  defp do_row(row, limit) when row > limit, do: []
  defp do_row(row, limit) do
    [do_items(Enum.to_list(0..row - 1), row, 0) | do_row(row + 1, limit)]
  end

  defp do_items([], _, _), do: []
  defp do_items([head|tail], row, last) do
    iteration = head + 1
    next = cond do
      head == 0 -> 1
      true      -> round(last * ((row + 1 - iteration) / head))
    end
    [next | do_items(tail, row, next)]
  end
end

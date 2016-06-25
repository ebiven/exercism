defmodule Minesweeper do

  # Build a helper for finding all adjacent cells.
  @adjacents for x <- [-1,0,1],
                 y <- [-1,0,1],
                 x != 0 or y != 0,
             do: {x,y}

  @doc """
  Annotate empty spots next to mines with the number of mines next to them.
  """
  @spec annotate([String.t]) :: [String.t]

  def annotate([]), do: []
  def annotate(board) do
    w = String.length(Enum.at(board, 0))
    h = Enum.count(board)

    # Create a map of cell coordinates and the integer to put in them
    # by finding the mines, then calling out to increment all adjacent
    # cells.
    indexed_board =
      Enum.reduce(Enum.with_index(board), %{}, fn {line, y}, acc ->
        Enum.reduce(Enum.with_index(String.to_char_list(line)), acc, fn
          {?*, x}, acc -> increment_adjacents({x, y}, {w, h}, acc)
          _, acc       -> acc
        end)
      end)

    # Reprocess the board, this time replacing non-mines with the
    # integers we calculated above if one exists, or a space.
    Enum.map(Enum.with_index(board), fn {line, y} ->
      Enum.map(Enum.with_index(String.to_char_list(line)), fn
        {?*, _} -> ?*
        { _, x} -> case indexed_board[{x, y}] do
                     nil -> ?\s
                     n   -> ?0 + n
                   end
      end)
      |> to_string
    end)
  end

  defp increment_adjacents(cell, bounds, a) do
    # For the given cell, iterate all adjacent cells. If the calculated
    # cell exists then apply the position and an incremented value to
    # the accumulator.
    Enum.reduce(@adjacents, a, fn v, acc ->
      c = get_cell(cell, v)
      if valid_cell?(c, bounds) do
        Map.update(acc, c, 1, &(&1+1))
      else
        acc
      end
    end)
  end

  defp valid_cell?({x, y}, {w, h}) do
    x >= 0 && x < w && y >= 0 && y < h
  end

  defp get_cell({x1, y1}, {x2, y2}), do: {x1 + x2, y1 + y2}
end

defmodule Connect do

  @doc """
  Calculates the winner (if any) of a board
  using "O" as the white player
  and "X" as the black player
  """
  @spec result_for([String.t]) :: :none | :black | :white
  def result_for(board) do
    goal_x = (board |> Enum.at(0) |> String.length) - 1
    cond do
      board |> pieces_for("X") |> winner?(goal_x) -> :black
      board |> pieces_for("O") |> winner?(goal_x) -> :white
      true -> :none
    end
  end

  defp pieces_for(board, player) do
    board
    |> transpose(player)
    |> build_board
    |> Enum.filter(fn {_, _, v} -> v == player end)
    |> Enum.map(fn {x, y, _} -> {x, y} end)
  end

  defp transpose(board, player) do
    # Transpose the board if this is player X so that we don't
    # have to care later about which side of the board to start
    # on.
    cond do
      player == "O" -> board
      true ->
        board
        |> Enum.map(&String.codepoints/1)
        |> List.zip
        |> Enum.map(&Enum.join(Tuple.to_list(&1)))
    end
  end

  defp build_board(board) do
    d = Enum.count(board) - 1
    for x <- 0..d,
        y <- 0..d,
        v = board |> Enum.at(x) |> String.at(y),
        do: {x, y, v}
  end

  # You can't win if you don't play.
  defp winner?([], _), do: false
  defp winner?(pieces, goal_x) do
    pieces
    # Find the starting pieces.
    |> Enum.filter(fn {x, _} -> x == 0 end)
    # Start following the adjacent pieces.
    |> Enum.any?(&(adjacent?(&1, pieces, goal_x)))
  end

  defp adjacent?(cell={x, _}, pieces, goal_x) do
    next = get_adjacents(cell, pieces)
    cond do
      # We managed to reach the goal.
      goal_x == x           -> true
      # Nothing more in this chain.
      Enum.count(next) == 0 -> false
      # Continue down the chain, remove ourselves so we can't get a
      # circular reference.
      true                  ->
        Enum.any?(next, &(adjacent?(&1, List.delete(pieces, cell), goal_x)))
    end
  end

  defp get_adjacents({x, y}, pieces) do
    # Hooray for hexagons.
    adjacent_coords = [
      {x + 1, y},
      {x - 1, y},
      {x, y + 1},
      {x, y - 1},
      {x + 1, y - 1},
      {x - 1, y + 1}
    ]
    Enum.filter(pieces, &(&1 in adjacent_coords))
  end
end

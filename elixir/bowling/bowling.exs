defmodule Bowling do

  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """

  @spec start() :: any
  def start, do: []

  @doc """
    Records the number of pins knocked down on a single roll. Returns `:ok`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful message.
  """

  @spec roll(any, integer) :: any | String.t
  def roll(game, roll) do
    game = game ++ [roll]
    cond do
      roll < 0 || roll > 10 -> {:error, "Pins must have a value from 0 to 10"}
      !valid_game?(game)    -> {:error, "Pin count exceeds pins on the lane"}
      true                  -> game
    end
  end

  defp valid_game?([]), do: true
  defp valid_game?([first]), do: true
  defp valid_game?([first, second|tail]) do
    if first == 10 do
      valid_game?([second] ++ tail)
    else
      if first + second > 10 do
        false
      else
        valid_game?(tail)
      end
    end
  end

  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful message.
  """

  @spec score(any) :: integer | String.t
  def score(game) do
    if Enum.count(game) < 10 do
      {:error, "Score cannot be taken until the end of the game"}
    else
      score(game, 0)
    end
  end

  defp score([], acc), do: acc

  # Strike in the last frame.
  defp score([10, next, following], acc) do
    score([], acc + 10 + next + following)
  end

  # Strike during the game.
  defp score([10|tail], acc) do
    [next, following|_rest] = tail
    score(tail, acc + 10 + next + following)
  end

  # Spare in the last frame.
  defp score([first, second, next], acc) when first + second == 10 do
    score([], acc + 10 + next)
  end

  # Spare during the game.
  defp score([first, second|tail], acc) when first + second == 10 do
    [next|_rest] = tail
    score(tail, acc + 10 + next)
  end

  # Everything else.
  defp score([first, second|tail], acc) do
    score(tail, acc + first + second)
  end
end

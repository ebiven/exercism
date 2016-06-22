defmodule Scrabble do

  # Human readable version.
  @score_map %{
    1 => ~w(a e i o u l n r s t),
    2 => ~w(d g),
    3 => ~w(b c m p),
    4 => ~w(f h v w y),
    5 => ~w(k),
    8 => ~w(j x),
    10 => ~w(q z)
  }
  # Invert for easy/fast lookup.
  @points for {k,vs} <- @score_map, v <- vs, into: %{}, do: {v,k}

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase
    |> String.replace(~r/[^a-z]/, "")
    |> String.codepoints
    |> Enum.reduce(0, &(Map.get(@points, &1) + &2))
  end
end

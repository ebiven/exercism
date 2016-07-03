defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    lc_base = letter_counts(base)
    candidates
    |> Enum.filter(&(lc_base === letter_counts(&1)))
    |> Enum.reject(&(String.downcase(base) === String.downcase(&1)))
  end

  def letter_counts(word) do
    word
    |> String.downcase
    |> String.codepoints
    |> Enum.sort
    #word
    #|> String.downcase
    #|> String.split("", trim: true)
    #|> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1+1)) end)
  end
end

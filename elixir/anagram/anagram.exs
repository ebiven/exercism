defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, &(is_anagram?(&1, base)))
  end

  defp is_anagram?(candidate, base) do
    letter_counts(candidate) == letter_counts(base) &&
      String.downcase(candidate) != String.downcase(base)
  end

  def letter_counts(word) do
    word |> String.downcase |> String.codepoints |> Enum.sort
  end
end

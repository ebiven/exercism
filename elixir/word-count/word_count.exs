defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> sanitize
    |> String.split
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
  end

  defp sanitize(sentence) do
    sentence
    |> String.downcase
    |> String.replace("_", " ") # Underscores are spaces.
    |> String.replace(~r/[^\p{L}\d -]/iu, "") # Keep only letters, numbers, spaces, and hyphens.
  end
end

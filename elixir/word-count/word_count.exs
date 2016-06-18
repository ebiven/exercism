defmodule Words do
  import String, only: [downcase: 1, replace: 3, split: 1]

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> downcase
    |> replace("_", " ") # Underscores are spaces.
    |> replace(~r/[^\w\d -]/iu, "") # Keep letters, numbers, spaces, and hyphens.
    |> split
    |> group(%{})
  end

  def group([], map), do: map
  def group(list = [head|tail], map) do
    group(tail, Map.update(map, head, 1, &(&1 + 1)))
  end
end

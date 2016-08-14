defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    cps = sentence
          |> String.downcase
          |> String.replace(~r/[^\p{L}]/u, "")
          |> String.codepoints

    Enum.count(cps) == cps |> Enum.uniq |> Enum.count
  end
end

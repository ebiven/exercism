defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/(?=\p{Lu})|[ -]/u)
    |> Enum.map_join("", &(&1 |> String.first |> String.upcase))
  end
end

defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/(?=[A-Z])|[ -]/u)
    |> Enum.map(&(String.at(&1, 0)))
    |> Enum.map(&String.upcase/1)
    |> Enum.join
  end
end

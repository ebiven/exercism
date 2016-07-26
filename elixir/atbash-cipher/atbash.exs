defmodule Atbash do

  @key Enum.zip(?a..?z, ?z..?a) |> Map.new

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    plaintext
    |> String.downcase
    |> String.replace(~r/[^a-z0-9]/, "")
    |> String.to_charlist
    |> Enum.map(&Map.get(@key, &1, &1))
    |> Enum.chunk(5, 5, [])
    |> Enum.join(" ")
  end
end

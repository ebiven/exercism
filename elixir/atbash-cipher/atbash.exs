defmodule Atbash do

  @codes Enum.to_list(?a..?z)
  @alpha_key for {k,v} <- Enum.zip(@codes, Enum.reverse(@codes)), into: %{}, do: {k,v}
  @key for v <- ?0..?9, into: @alpha_key, do: {v,v}

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
    |> String.codepoints
    |> Enum.map(&(Map.get(@key, hd String.to_char_list(&1))))
    |> Enum.chunk(5, 5, [])
    |> Enum.join(" ")
  end
end

defmodule CryptoSquare do
  @doc """
  Encode string square methods
  ## Examples

    iex> CryptoSquare.encode("abcd")
    "ac bd"
  """
  @spec encode(String.t) :: String.t
  def encode(str) do
    str
    |> String.downcase
    |> String.replace(~r/[^0-9a-z]/, "")
    |> String.codepoints
    |> chunker
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.join/1)
    |> Enum.join(" ")
    |> String.replace("_", "")
  end

  defp chunker(list) do
    chunk_size = :math.sqrt(length(list)) |> Float.ceil |> round
    list
    |> padder(chunk_size)
    |> chunker(chunk_size, [])
  end

  defp padder([], _), do: []
  defp padder(list, chunk_size) do
    cond do
      rem(Enum.count(list), chunk_size) == 0 -> list
      true -> padder(List.insert_at(list, -1, "_"), chunk_size)
    end
  end

  defp chunker([], _, acc), do: Enum.reverse(acc)
  defp chunker(list, size, acc) do
    {chunk, remainder} = Enum.split(list, size)
    chunker(remainder, size, [chunk|acc])
  end
end

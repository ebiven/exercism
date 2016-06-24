defmodule RailFenceCipher do
  @doc """
  Encode a given plaintext to the corresponding rail fence ciphertext
  """
  @spec encode(String.t, pos_integer) :: String.t
  def encode(str, 1), do: str
  def encode(str, rails) do
    str
    |> String.codepoints
    |> build_fence(rails)
    |> Enum.join
  end

  @doc """
  Decode a given rail fence ciphertext to the corresponding plaintext
  """
  @spec decode(String.t, pos_integer) :: String.t
  def decode(str, 1), do: str
  def decode(str, rails) do
    0..String.length(str) - 1
    |> Enum.to_list
    |> build_fence(rails)
    |> reassemble(str)
  end

  defp build_fence(chars, rails) do
    fence_map = Enum.concat(Enum.to_list(0..rails-1), Enum.to_list(rails-2..1))
    build_empty_fence(Enum.count(chars), rails)
    |> fill_fence(fence_map, chars)
  end

  defp build_empty_fence(cols, rows) do
    0..rows - 1
    |> Enum.map(fn _ -> List.duplicate(:placehoder, cols) end)
  end

  defp fill_fence(empty_fence, fence_map, chars) do
    chars
    |> Enum.with_index
    |> Enum.reduce(empty_fence, fn x, acc -> fence_reducer(x, acc, fence_map) end)
    |> List.flatten
    |> Enum.reject(&(&1 == :placehoder))
  end

  defp fence_reducer({char, index}, acc, fence_map) do
    rail_ind = Enum.at(fence_map, rem(index, length(fence_map)))
    List.update_at(acc, rail_ind, &(List.update_at(&1, index, fn _ -> char end)))
  end

  defp reassemble(fence, str) do
    0..String.length(str) - 1
    |> Enum.map(fn i -> String.at(str, Enum.find_index(fence, &(&1 == i))) end)
    |> Enum.join
  end
end

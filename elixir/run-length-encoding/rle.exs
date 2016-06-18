defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(string) do
    string
    |> String.split("", trim: true)
    |> Enum.chunk_by(&(&1))
    |> Enum.reduce("", &encode_reducer/2)
  end

  def encode_reducer(x = [head|_tail], acc) do
    acc <> "#{Enum.count(x)}#{head}"
  end

  @spec decode(String.t) :: String.t
  def decode(""), do: ""
  def decode(string) do
    string
    |> split
    |> List.flatten
    |> Enum.reduce("", &decode_reducer/2)
  end

  def split(string), do: Regex.scan(~r/\d+[A-Z]/u, string)

  def decode_reducer(item, acc) do
    {times, letter} = Integer.parse(item)
    acc <> String.duplicate(letter, times)
  end
end

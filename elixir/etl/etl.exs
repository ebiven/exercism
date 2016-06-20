defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input) do
    Enum.reduce(input, %{}, &reducer/2)
  end

  def reducer({_, []}, acc), do: acc
  def reducer({key, [head|tail]}, acc) do
    acc = Map.put_new(acc, String.downcase(head), key)
    reducer({key, tail}, acc)
  end
end

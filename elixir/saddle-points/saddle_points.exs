defmodule Matrix do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    str
    |> String.split("\n")
    |> Enum.map(&(String.split(&1, " ")))
    |> Enum.map(&(for i <- &1, do: String.to_integer(i)))
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str) do
    str
    |> rows
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  #It's called a "saddle point" because it is greater than or equal to
  #every element in its row and the less than or equal to every element in
  #its column.
  #
  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    rs = rows(str)
    cs = columns(str)
    for x <- 0..length(rs) - 1,
        y <- 0..length(cs) - 1,
        r = Enum.at(rs, x),
        c = Enum.at(cs, y),
        el = Enum.at(r, y),
        Enum.all?(r, &(&1 <= el)),
        Enum.all?(c, &(&1 >= el)),
    do: {x, y}
  end
end

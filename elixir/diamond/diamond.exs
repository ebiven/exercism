defmodule Diamond do
  @doc """
  Given a letter, it prints a diamond starting with 'A',
  with the supplied letter at the widest point.
  """
  @spec build_shape(char) :: String.t
  def build_shape(?A), do: "A\n"
  def build_shape(letter) do
    dimension    = (letter - 64) * 2 - 1
    mid_point    = (dimension/2) |> Float.floor |> round
    range1       = 0..mid_point
    range2       = (mid_point - 1)..0
    range        = Enum.concat(Enum.to_list(range1), Enum.to_list(range2))
    shape_list   = build_shape(range, dimension, mid_point, [])
    shape_string = Enum.join(shape_list, "\n")
    "#{shape_string}\n"
  end

  def build_shape([], dimension, mid_point, acc), do: acc
  def build_shape([head|tail], dimension, mid_point, acc) do
    row = " "
    |> List.duplicate(dimension)
    |> List.replace_at(mid_point - head, [head + 65])
    |> List.replace_at(mid_point + head, [head + 65])
    |> Enum.join
    |> String.rstrip

    build_shape(tail, dimension, mid_point, [row | acc])
  end
end

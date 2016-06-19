defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a),      do: :equal
  def compare([], [nil]), do: :sublist
  def compare([nil], []), do: :superlist

  def compare(a, b) do
    s_a = "," <> Enum.join(a, ",") <> ","
    s_b = "," <> Enum.join(b, ",") <> ","
    cond do
      String.contains?(s_b, s_a) -> :sublist
      String.contains?(s_a, s_b) -> :superlist
      true                       -> :unequal
    end
  end
end

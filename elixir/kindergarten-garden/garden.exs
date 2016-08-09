defmodule Garden do
  @plants %{
    "C" => :clover,
    "G" => :grass,
    "R" => :radishes,
    "V" => :violets
  }

  @default_students [:alice, :bob, :charlie, :david, :eve, :fred, :ginny, :harriet, :ileana, :joseph, :kincaid, :larry]

  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @default_students) do
    rows = info_string
    |> String.split("\n")
    |> Enum.map(&split_row/1)

    student_names
    |> Enum.sort
    |> Enum.with_index
    |> Enum.reduce(%{}, &(student_reducer(&1, &2, rows)))

  end

  defp split_row(row) do
    row
    |> String.codepoints
    |> Enum.map(&(@plants[&1]))
  end

  defp student_reducer({name, index}, acc, rows) do
    real_index = index * 2
    plants = cond do
      real_index >= rows |> List.first |> length -> {}
      true -> { rows |> List.first |> Enum.at(real_index),
                rows |> List.first |> Enum.at(real_index + 1),
                rows |> List.last  |> Enum.at(real_index),
                rows |> List.last  |> Enum.at(real_index + 1)
              }
    end
    Map.put(acc, name, plants)
  end
end

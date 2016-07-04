defmodule CustomSet do
  defstruct list: []

  def delete(set, value), do: new(Enum.reject(set.list, &(&1 === value)))

  def difference(s1, s2), do: new(s1.list -- s2.list)

  def disjoint?(s1, s2), do: size(intersection(s1, s2)) == 0

  def empty(_set), do: new()

  def equal?(s1, s2), do: s1.list == s2.list

  def intersection(s1, s2), do: new(Enum.filter(s1.list, &(member?(s2, &1))))

  def member?(set, value), do: Enum.any?(set.list, &(&1 === value))

  def new(), do: %CustomSet{}
  def new([]), do: %CustomSet{}
  def new(set), do: %CustomSet{list: set |> Enum.uniq |> Enum.sort}

  def put(%CustomSet{list: values}, value), do: new([value|values])

  def size(set), do: Enum.count(set.list)

  def subset?(s1, s2), do: Enum.all?(s1.list, &(member?(s2, &1)))

  def to_list(set), do: set.list

  def union(s1, s2), do: new(s1.list ++ s2.list)
end

defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    days = Map.get(month_map(year, month), day_to_int(weekday))
    {year, month, nth_item(days, schedule)}
  end

  def month_map(year, month) do
    ldom = :calendar.last_day_of_the_month(year, month)
    Enum.reduce(1..ldom, %{}, fn x, acc -> reducer(x, acc, year, month) end)
  end

  def reducer(x, acc, year, month) do
    Map.update(acc, :calendar.day_of_the_week(year, month, x), [x], &(Enum.sort([x|&1])))
  end

  def day_to_int(:monday),    do: 1
  def day_to_int(:tuesday),   do: 2
  def day_to_int(:wednesday), do: 3
  def day_to_int(:thursday),  do: 4
  def day_to_int(:friday),    do: 5
  def day_to_int(:saturday),  do: 6
  def day_to_int(:sunday),    do: 7

  def nth_item(list, :first),  do: Enum.at(list, 0)
  def nth_item(list, :second), do: Enum.at(list, 1)
  def nth_item(list, :third),  do: Enum.at(list, 2)
  def nth_item(list, :fourth), do: Enum.at(list, 3)
  def nth_item(list, :last),   do: Enum.at(list, -1)
  def nth_item(list, :teenth), do: Enum.find(list, &(&1 > 12 && &1 < 20))
end

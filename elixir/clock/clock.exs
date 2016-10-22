defmodule Clock do
  defstruct hour: 0, minute: 0

  @doc """
  Returns a string representation of a clock:

      iex> Clock.new(8, 9) |> to_string
      "08:09"
  """
  @spec new(integer, integer) :: Clock
  def new(hour, minute) do
    t = total_minutes(hour, minute)
    h = hour_part(t)
    m = minute_part(t)
    %Clock{hour: h, minute: m}
  end

  @doc """
  Adds two clock times:

      iex> Clock.add(10, 0) |> Clock.add(3) |> to_string
      "10:03"
  """
  @spec add(Clock, integer) :: Clock
  def add(%Clock{hour: hour, minute: minute}, add_minute) do
    new(hour, minute + add_minute)
  end

  defp total_minutes(hour, minute) do
    hour * 60 + minute
  end

  defp hour_part(minutes) do
    # We have floor and round this because rem isn't mod.
    floored = round Float.floor(minutes/60)
    mod_ish(floored, 24)
  end

  defp minute_part(minutes) do
    mod_ish(minutes, 60)
  end

  defp mod_ish(x, y) when x <  0 and rem(x, y) == 0, do: 0
  defp mod_ish(x, y) when x <  0,                    do: y + rem(x, y)
  defp mod_ish(x, y) when x >= 0,                    do: rem(x, y)

  defimpl String.Chars, for: Clock do
    def to_string(%Clock{hour: hour, minute: minute}) do

      "#{padder(hour)}:#{padder(minute)}"
    end

    defp padder(num) do
      num |> Integer.to_string |> String.pad_leading(2, "0")
    end
  end
end

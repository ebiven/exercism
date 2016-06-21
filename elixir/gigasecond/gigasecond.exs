defmodule Gigasecond do
  @gigasecond 1_000_000_000

	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) :: :calendar.datetime

	def from(bday = {{year, month, day}, {hours, minutes, seconds}}) do
    birth_seconds = :calendar.datetime_to_gregorian_seconds(bday)
    :calendar.gregorian_seconds_to_datetime(birth_seconds + @gigasecond)
	end
end

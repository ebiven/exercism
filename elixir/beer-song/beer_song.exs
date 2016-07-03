defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(1) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end

  def verse(2) do
    number = 1
    """
    #{bottle(number)} of beer on the wall, #{bottle(number)} of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    """
  end

  def verse(number) do
    number = number - 1
    """
    #{bottle(number)} of beer on the wall, #{bottle(number)} of beer.
    Take one down and pass it around, #{bottle(number - 1)} of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range \\ 100..1) do
    Enum.map_join(range, "\n", &verse/1)
  end

  def bottle(1), do: "1 bottle"
  def bottle(number), do: "#{number} bottles"
end

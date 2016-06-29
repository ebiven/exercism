defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(amount, values) do
    gather(amount, build_coin_map(values))
  end

  defp build_coin_map(coins) do
    for c <- coins, into: %{}, do: {c, 0}
  end

  defp gather(0, change), do: {:ok, change}
  defp gather(remaining, change) do
    next_coins = Map.keys(change) |> Enum.filter(&(&1 <= remaining))
    case length(next_coins) do
      # There's remaining change to give, but no coins small enough to
      # cover it.
      0 -> :error
      _ ->
        next_coin = Enum.max(next_coins)
        change    = Map.update(change, next_coin, 1, &(&1 + 1))
        remaining = remaining - next_coin
        gather(remaining, change)
    end
  end
end

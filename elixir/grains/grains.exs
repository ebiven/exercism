defmodule Grains do
  require Integer
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) do
    pow(2, number - 1)
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    Enum.reduce(1..64, 0, &(square(&1) + &2))
  end

  # Implement pow instead of using the Erlang function because I can.
  def pow(_, 0), do: 1
  def pow(n, p) when Integer.is_odd(p), do: n * pow(n, p - 1)
  def pow(n, p) do
    result = pow(n, div(p, 2))
    result * result
  end
end

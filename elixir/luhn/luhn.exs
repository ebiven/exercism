defmodule Luhn do
  import Integer
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number) do
    number
    |> String.to_integer
    |> Integer.digits
    |> Enum.reverse
    |> do_calc
    |> Enum.reverse
    |> Enum.sum
  end

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    rem(checksum(number), 10) == 0
  end

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
    n = number <> "0"
    check_digit = checksum(n)
    check_digit = rem(check_digit, 10)
    check_digit = cond do
      check_digit == 0 -> 0
      true             -> 10 - check_digit
    end

    "#{number}#{check_digit}"
  end

  defp do_calc(digits), do: do_calc(digits, false)
  defp do_calc([], _), do: []
  defp do_calc([head|tail], true) do
    head = head * 2
    if head > 9, do: head = head - 9
    [head|do_calc(tail, false)]
  end
  defp do_calc([head|tail], false) do
    [head|do_calc(tail, true)]
  end
end

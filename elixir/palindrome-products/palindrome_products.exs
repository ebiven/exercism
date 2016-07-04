defmodule Palindromes do
  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map
  def generate(max_factor, min_factor \\ 1)

  def generate(max_factor, min_factor) do
    generate(min_factor, min_factor, max_factor, %{})
  end

  def generate(x, y, max, acc) do
    acc = cond do
      is_palindrome(x*y) -> Map.update(acc, x*y, [[x,y]], &([[x,y]|&1]))
      true               -> acc
    end
    cond do
      x >= max && y >= max   -> acc
      y <  max               -> generate(x, y+1, max, acc)
      y >= max               -> generate(x+1, x+1, max, acc)
    end
  end

  defp is_palindrome(number) do
    number_string = Integer.to_string(number)
    number_string == String.reverse(number_string)
  end
end

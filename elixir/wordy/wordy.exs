defmodule Wordy do
  require Integer

  @doc """
  Calculate the math problem in the sentence.
  """
  @spec answer(String.t) :: integer
  def answer(question) do
    parts = question
    |> valid_start!
    |> parse
    |> List.flatten
    |> valid_parts_count!

    [head|tail] = parts
    do_math(tail, String.to_integer(head))
  end

  defp valid_start!(question) do
    unless String.starts_with?(question, "What is ") do
      raise ArgumentError
    end
    question
  end

  defp valid_parts_count!(parts) do
    c = Enum.count(parts)
    unless c > 2 && Integer.is_odd(c) do
      raise ArgumentError
    end
    parts
  end

  defp parse(question) do
    Regex.scan(~r/\-?\d+|plus|minus|divided by|multiplied by/, question)
  end

  defp do_math([], acc), do: acc
  defp do_math([operator, i|tail], acc) do
    i = String.to_integer(i)
    acc = case operator do
      "plus"          -> acc + i
      "minus"         -> acc - i
      "divided by"    -> acc / i
      "multiplied by" -> acc * i
    end
    do_math(tail, acc)
  end
end

defmodule Bob do
  def hey(input) do
    cond do
      question?(input) -> "Sure."
      nothing?(input)  -> "Fine. Be that way!"
      yelling?(input)  -> "Whoa, chill out!"
      true             -> "Whatever."
    end
  end

  defp question?(input), do: String.ends_with?(input, "?")
  defp nothing?(input), do: String.trim(input) == ""
  defp yelling?(input) do
    # String is all upper-case and has at least one letter.
    String.upcase(input) == input && String.match?(input, ~r/\p{L}/u)
  end
end

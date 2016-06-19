defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw
    |> String.replace(~r/[()-\. ]/, "")
    |> strip_country_code
    |> valid_length?
  end

  defp strip_country_code(number) do
    is_11 = String.length(number) == 11
    starts_with_1 = String.starts_with?(number, "1")
    cond do
      is_11 && starts_with_1 -> String.replace_prefix(number, "1", "")
      true                   -> number
    end
  end

  defp valid_length?(number) do
    cond do
      String.length(number) == 10 -> number
      true                        -> "0000000000"
    end
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw
    |> number
    |> String.slice(0..2)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    n           = number(raw)
    area_code   = area_code(n)
    office_code = String.slice(n, 3..5)
    phone_num   = String.slice(n, 6..9)
    "(#{area_code}) #{office_code}-#{phone_num}"
  end
end

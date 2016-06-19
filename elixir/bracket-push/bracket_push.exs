defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """

  @openers ["{", "[", "("]
  @closers ["}", "]", ")"]
  @pairs Enum.zip(@openers, @closers)

  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    # The accumulator tracks the currently open brackets by pushing
    # opened brackets onto the front, then removing them when they
    # close.
    open = []
    str_list = String.split(str, "", trim: true)
    # Strings with properly closed brackets (including no brackets)
    # will reduce to an empty list.
    [] == Enum.reduce(str_list, open, &reducer/2)
  end

  def reducer(x, []) do
    # If our accumulator is empty and this character is an opener
    # then push it onto the accumulator.
    cond do
      Enum.member?(@openers, x) -> [x]
      true                      -> []
    end
  end

  def reducer(x, acc = [head|tail]) do
    cond do
      # If this is an opener, push it onto the front of our
      # accumulator.
      Enum.member?(@openers, x)       -> [x | acc]
      # If we have a pair that is the head of the list and
      # this character then we are properly closing a pair,
      # we can just return the tail.
      Enum.member?(@pairs, {head, x}) -> tail
      # If this is a closer, but we didn't match a pair above, then we
      # got an unopened closing bracket making the pairs unbalanced.
      # Jam on a placeholder that can't be stripped off accidentally
      # later, ensuring the accumulator can't come back empty.
      Enum.member?(@closers, x)       -> [:holder | acc] # we got an unopened closer
      # This isn't a bracket, move on.
      true                            -> acc
    end
  end
end

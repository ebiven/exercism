defmodule Forth do
  @opaque evaluator :: %Forth{}

  defstruct stack: [], words: %{}, current_stack: []

  @doc """
  Create a new evaluator.
  """
  @spec new() :: evaluator
  def new() do
    %Forth{}
  end

  @doc """
  Evaluate an input string, updating the evaluator state.
  """
  @spec eval(evaluator, String.t) :: evaluator
  def eval(ev, s) do
    eval %Forth{ev|stack: tokens(s)}
  end
  defp eval(ev=%Forth{stack: [], current_stack: cs}) do
    %Forth{ev|stack: cs}
  end
  defp eval(ev=%Forth{stack: [head|tail], words: words, current_stack: cs}) do
    cond do
      head == ":" ->
        %Forth{ev|words: add_word(words, tail)}

      Enum.count(Map.keys(ev.words)) > 0 ->
        eval(expand(ev))

      is_integer(head) ->
        eval(%Forth{ev|stack: tail, current_stack: cs ++ [head]})

      !valid_operator?(head) ->
        raise Forth.UnknownWord

      true ->
        eval(%Forth{ev|stack: List.flatten([do_statement(cs, head)|tail]), current_stack: []})

    end
  end

  defp add_word(words, [new_word|tail]) do
    if is_integer(new_word) do
      raise Forth.InvalidWord
    end
    sub = Enum.reject(tail, &(&1 == ";"))
    case Enum.count(sub) do
      0 -> raise Forth.InvalidWord
      _ -> Map.update(words, new_word, sub, fn _x -> sub end)
    end
  end

  defp do_statement([], "DUP"), do: raise Forth.StackUnderflow
  defp do_statement(cs, "DUP") do
    cs ++ [List.last(cs)]
  end

  defp do_statement([], "DROP"), do: raise Forth.StackUnderflow
  defp do_statement(cs, "DROP") do
    List.delete_at(cs, Enum.count(cs) - 1)
  end

  defp do_statement([], "SWAP"), do: raise Forth.StackUnderflow
  defp do_statement([_first], "SWAP"), do: raise Forth.StackUnderflow
  defp do_statement(cs, "SWAP") do
    [a,b|tail] = Enum.reverse(cs)
    Enum.reverse([b,a|tail])
  end

  defp do_statement([], "OVER"), do: raise Forth.StackUnderflow
  defp do_statement([_first], "OVER"), do: raise Forth.StackUnderflow
  defp do_statement(cs, "OVER") do
    [a,b|tail] = Enum.reverse(cs)
    Enum.reverse([b,a,b|tail])
  end

  defp do_statement([0], "/"), do: raise Forth.DivisionByZero
  defp do_statement([], _operator), do: raise Forth.StackUnderflow
  defp do_statement([_head], _operator), do: raise Forth.StackUnderflow

  defp do_statement([head|tail], "+"), do: Enum.reduce(tail, head, &(&2 + &1))
  defp do_statement([head|tail], "-"), do: Enum.reduce(tail, head, &(&2 - &1))
  defp do_statement([head|tail], "*"), do: Enum.reduce(tail, head, &(&2 * &1))
  defp do_statement([head|tail], "/"), do: Enum.reduce(tail, head, &(div(&2, &1)))

  @doc """
  Return the current stack as a string with the element on top of the stack
  being the rightmost element in the string.
  """
  @spec format_stack(evaluator) :: String.t
  def format_stack(ev) do
    ev.stack |> Enum.join(" ")
  end

  defp tokens(s) do
    Regex.split(~r/[^\p{L}\p{N}\p{S}\p{P}]+/u, s)
    |> Enum.map(fn v ->
                  case Integer.parse(v) do
                    {i, ""} -> i
                    _       -> String.upcase(v)
                  end
       end)
  end

  defp expand(ev) do
    new_stack = Enum.map(ev.stack, fn x ->
      case Map.get(ev.words, x) do
        nil -> x
        _   -> ev.words[x]
      end
    end)
    |> List.flatten

    %Forth{ev|stack: new_stack, words: %{}}
  end

  defp valid_operator?(op) do
    op in ~w(DUP DROP SWAP OVER + - * /)
  end

  defmodule StackUnderflow do
    defexception []
    def message(_), do: "stack underflow"
  end

  defmodule InvalidWord do
    defexception [word: nil]
    def message(e), do: "invalid word: #{inspect e.word}"
  end

  defmodule UnknownWord do
    defexception [word: nil]
    def message(e), do: "unknown word: #{inspect e.word}"
  end

  defmodule DivisionByZero do
    defexception []
    def message(_), do: "division by zero"
  end
end

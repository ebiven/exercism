defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: reduce(l, 0, fn _x, acc -> acc + 1 end)

  @spec reverse(list) :: list
  def reverse(l), do: reduce(l, [], fn x, acc -> [x | acc] end)

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    l
    |> reduce([], fn x, acc -> [f.(x) | acc] end)
    |> reverse
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    s = fn x, acc ->
      cond do
        f.(x) -> [x | acc]
        true  -> acc
      end
    end

    l
    |> reduce([], s)
    |> reverse
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([head|tail], acc, f), do: reduce(tail, f.(head, acc), f)

  @spec append(list, list) :: list
  def append(a, b) do
    r = reduce(a, [], fn x, acc -> [x | acc] end)
    r = reduce(b, r, fn x, acc -> [x | acc] end)
    reverse(r)
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    fun = &[&1|&2]
    ll
    |> reduce([], &reduce(&1, &2, fun))
    |> reverse
  end
end

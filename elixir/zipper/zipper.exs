defmodule BinTree do
  @moduledoc """
  A node in a binary tree.

  `value` is the value of a node.
  `left` is the left subtree (nil if no subtree).
  `right` is the right subtree (nil if no subtree).
  """
  @type t :: %BinTree{ value: any, left: BinTree.t | nil, right: BinTree.t | nil }
  defstruct value: nil, left: nil, right: nil
end

defmodule Zipper do

  defstruct value: nil, left: nil, right: nil, trail: []

  @doc """
  Get a zipper focused on the root node.
  """
  @spec from_tree(BT.t) :: Z.t
  def from_tree(%BinTree{value: v, left: l, right: r}) do
    %Zipper{value: v, left: l, right: r, trail: []}
  end

  @doc """
  Get the complete tree from a zipper.
  """
  @spec to_tree(Z.t) :: BT.t
  def to_tree(%Zipper{value: v, left: l, right: r, trail: t}) do
    construct_tree(%BinTree{value: v, left: l, right: r}, t)
  end

  @doc """
  Get the value of the focus node.
  """
  @spec value(Z.t) :: any
  def value(%Zipper{value: v}), do: v

  @doc """
  Get the left child of the focus node, if any.
  """
  @spec left(Z.t) :: Z.t | nil
  def left(%Zipper{left: nil}), do: nil
  def left(%Zipper{value: v, left: %BinTree{value: lv, left: ll, right: lr}, right: r, trail: t}) do
    %Zipper{value: lv, left: ll, right: lr, trail: [{:left, v, r}|t]}
  end

  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Z.t) :: Z.t | nil
  def right(%Zipper{right: nil}), do: nil
  def right(%Zipper{value: v, left: l, right: %BinTree{value: rv, left: rl, right: rr}, trail: t}) do
    %Zipper{value: rv, left: rl, right: rr, trail: [{:right, v, l}|t]}
  end

  @doc """
  Get the parent of the focus node, if any.
  """
  @spec up(Z.t) :: Z.t
  def up(%Zipper{value: v, left: l, right: r, trail: t}) do
    case t do
      [] -> nil
      [{:left, pv, pr}|pt]  -> %Zipper{value: pv, left: %BinTree{value: v, left: l, right: r}, right: pr, trail: pt}
      [{:right, pv, pl}|pt] -> %Zipper{value: pv, left: pl, right: %BinTree{value: v, left: l, right: r}, trail: pt}
    end
  end

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Z.t, any) :: Z.t
  def set_value(z, v), do: %{z|value: v}

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Z.t, BT.t) :: Z.t
  def set_left(z, l), do: %{z|left: l}

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Z.t, BT.t) :: Z.t
  def set_right(z, r), do: %{z|right: r}

  defp construct_tree(b, []), do: b
  defp construct_tree(b, [{:left, v, r}|tail]) do
    construct_tree(%BinTree{value: v, left: b, right: r}, tail)
  end
  defp construct_tree(b, [{:right, v, l}|tail]) do
    construct_tree(%BinTree{value: v, left: l, right: b}, tail)
  end
end

defmodule Graph do
  defstruct attrs: [], nodes: [], edges: []
end

defmodule Dot do
  defmacro graph([do: ast]) do
    ast
    |> parse(%Graph{})
    |> Macro.escape
  end

  defp parse([], g), do: g
  defp parse(nil, g), do: g

  defp parse([head|tail], g), do: parse(head, parse(tail, g))

  defp parse({:graph, _, [[{attr, value}]]}, g), do: add_attr({attr, value}, g)
  defp parse({:graph, _, _}, g), do: g

  defp parse({:__block__, _, ast}, g), do: parse(ast, g)

  defp parse({:--, _, [ {e1, _, _}, {e2, _, [[{attr, value}]]} ] }, g), do: add_edge(e1, e2, [{attr, value}], g)
  defp parse({:--, _, [ {e1, _, _}, {e2, _, [[]]} ] }, g), do: add_edge(e1, e2, [], g)
  defp parse({:--, _, [ {e1, _, _}, {e2, _, nil} ] }, g), do: add_edge(e1, e2, [], g)

  defp parse({node, _, [[{attr, value}]]}, g), do: add_node(node, [{attr, value}], g)
  defp parse({node, _, [[]]}, g), do: add_node(node, [], g)
  defp parse({node, _, nil}, g), do: add_node(node, [], g)

  defp parse(_, _), do: raise ArgumentError

  defp add_node(node, attr, g=%Graph{nodes: nodes}) do
    %Graph{g | nodes: Enum.sort([{node, attr}|nodes])}
  end
  defp add_edge(e1, e2, attr, g=%Graph{edges: edges}) do
    %Graph{g | edges: Enum.sort([{e1, e2, attr}|edges])}
  end
  defp add_attr(attr, g=%Graph{attrs: attrs}) do
    %Graph{g | attrs: Enum.sort([attr|attrs])}
  end
end

defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """

  @spec parse(String.t) :: String.t
  def parse(markdown) do
    markdown
    |> String.split("\n")
    |> group_list_items
    |> Enum.reduce([], &reducer/2)
    |> Enum.reverse
    |> Enum.join("")
  end

  defp group_list_items(lines) do
    Enum.chunk_by(lines, &(String.first(&1) == "*"))
  end

  # Reducer for non-grouped lines.
  defp reducer(line, acc) when length(line) == 1 do
    # Fix bold and italics.
    line = List.first(line) |> bold |> italicize
    cond do
      # Parse headings.
      String.starts_with?(line, "#") ->
        [size, text] = String.split(line, " ", parts: 2)
        size = String.length(size)
        line = "<h#{size}>#{text}</h#{size}>"
        [line | acc]

      # Parse other lines.
      true ->
        line = "<p>#{line}</p>"
        [line | acc]
    end
  end

  # Reducer for grouped lines (unordered lists).
  defp reducer(line, acc) do
    line = line
    |> Enum.map(fn (item) ->
        item = item |> bold |> italicize |> String.replace("* ", "")
        "<li>#{item}</li>"
      end)
    |> Enum.join("")
    ["<ul>#{line}</ul>" | acc]
  end

  defp replacer(line, find, replace) do
    parts = String.split(line, find)
    cond do
      Enum.count(parts) == 3 ->
        "#{Enum.at(parts, 0)}<#{replace}>#{Enum.at(parts, 1)}</#{replace}>#{Enum.at(parts, 2)}"
      true -> line
    end
  end

  defp italicize(line) do
    replacer(line, "_", "i")
  end

  defp bold(line) do
    replacer(line, "__", "em")
  end
end

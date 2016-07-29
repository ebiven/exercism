defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new() :: Queens.t()
  @spec new({integer, integer}, {integer, integer}) :: Queens.t()
  def new(white \\ {0, 3}, black \\ {7, 3})
  def new(a, a), do: raise ArgumentError
  def new(white, black) do
    %{:white => white, :black => black}
  end

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(queens) do
    Enum.reduce(7..0, [], fn x, acc -> [draw_row(queens, x)|acc] end)
    |> Enum.join("\n")
  end

  def draw_row(queens, row) do
    Enum.reduce(7..0, [], fn x, acc -> [draw_cell(queens, row, x)|acc] end)
    |> Enum.join(" ")
  end

  def draw_cell(%{:white => {x, y}}, x, y), do: "W"
  def draw_cell(%{:black => {x, y}}, x, y), do: "B"
  def draw_cell(_, _, _),                   do: "_"

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%{:white => {a, _}, :black => {a, _}}), do: true
  def can_attack?(%{:white => {_, a}, :black => {_, a}}), do: true
  def can_attack?(%{:white => {wx, wy}, :black => {bx, by}}) do
    abs(wx-bx) == abs(wy-by)
  end
end

defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]
  @base_histogram for n <- @nucleotides, into: %{}, do: {n, 0}

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    unless nucleotide in @nucleotides, do: raise ArgumentError
    histogram(strand)[nucleotide]
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    unless valid_strand?(strand), do: raise ArgumentError
    Enum.reduce(strand, @base_histogram, fn x, acc -> Map.update!(acc, x, &(&1+1)) end)
  end

  def valid_strand?(strand) do
    Enum.all?(strand, &(&1 in @nucleotides))
  end
end

defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

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
    unless valid_nucleotide?(nucleotide), do: raise ArgumentError
    strand
    |> histogram
    |> Map.get(nucleotide)
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
    Enum.reduce(strand, base_histogram(), fn x, acc -> Map.update!(acc, x, &(&1+1)) end)
  end

  def valid_strand?(strand) do
    MapSet.subset?(MapSet.new(strand), MapSet.new(@nucleotides))
  end

  def valid_nucleotide?(nucleotide) do
    Enum.any?(@nucleotides, &(&1 === nucleotide))
  end

  def base_histogram() do
    Enum.reduce(@nucleotides, %{}, &(Map.put(&2, &1, 0)))
  end
end

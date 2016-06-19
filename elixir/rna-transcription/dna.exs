defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(&(substitute(&1)))
  end

  defp substitute(nucleotide) do
    case nucleotide do
      ?A -> ?U
      ?C -> ?G
      ?T -> ?A
      ?G -> ?C
    end
  end
end

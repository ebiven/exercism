module Translation

  TRANS = {
    'Methionine'    => %w(AUG),
    'Phenylalanine' => %w(UUU UUC),
    'Leucine'       => %w(UUA UUG),
    'Serine'        => %w(UCU UCC UCA UCG),
    'Tyrosine'      => %w(UAU UAC),
    'Cysteine'      => %w(UGU UGC),
    'Tryptophan'    => %w(UGG),
    'STOP'          => %w(UAA UAG UGA)
  }

  def self.of_codon(codon)
    TRANS
      .select { |k,v| v.include?(codon)}
      .keys.first or fail InvalidCodonError
  end

  def self.of_rna(input)
    input.chars.each_slice(3).with_object([]) do |i, acc|
      c = of_codon(i.join)
      return acc if c == 'STOP'
      acc.push(c)
    end
  end
end

class InvalidCodonError < StandardError; end

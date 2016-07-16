module BookKeeping
  VERSION = 4
end

class Complement
  def self.of_dna(strand)
    strand =~ /[^CGTA]/ ? '' : strand.tr('CGTA', 'GCAU')
  end
end

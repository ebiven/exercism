from string import maketrans

DNA_NUCLEOTIDES = 'AGCT'
DNA_TO_RNA_TRANSLATOR = maketrans(DNA_NUCLEOTIDES, 'UCGA')

def to_rna(strand):
    if any(nucleotide not in DNA_NUCLEOTIDES for nucleotide in strand):
        return ''

    return strand.translate(DNA_TO_RNA_TRANSLATOR)
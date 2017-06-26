const DNA_TO_RNA = { G: 'C', C: 'G', T: 'A', A: 'U' };

class Transcriptor {
  toRna(dna) {
    const nucleotides = [...dna];
    if (!nucleotides.every((n) => n in DNA_TO_RNA)) {
      throw 'Invalid input DNA.';
    }
    return nucleotides.map((n) => DNA_TO_RNA[n]).join('');
  }
}

export default Transcriptor;

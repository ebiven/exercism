const DNA_TO_RNA = { G: 'C', C: 'G', T: 'A', A: 'U' };

export default class Transcriptor {
    toRna(dna: string): string {
        const nucleotides = [...dna];
        if (!nucleotides.every((n) => n in DNA_TO_RNA)) {
            throw 'Invalid input DNA.';
        }
        return nucleotides.map((n) => DNA_TO_RNA[n]).join('');
    }
}
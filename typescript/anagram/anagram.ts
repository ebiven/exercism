export default class Anagram {
    private target: string;

    constructor(target: string) {
        this.target = target;
    }

    matches(...candidates: string[]): string[] {
        const t = this.target;
        return candidates
            .filter((c) => this.isAnagram(t, c));    
    }

    private isAnagram(a: string, b: string): boolean {
        return (
            a.toLowerCase() != b.toLowerCase() &&
            this.normalize(a) == this.normalize(b)
        );
    }

    private normalize(s: string): string {
        return [...s.toLowerCase()].sort().join('');
    }
}
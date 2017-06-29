export default class Hamming {
    compute(a: string, b: string): number {
        if (a === b) { return 0; }
        if (a.length != b.length) {
            throw 'DNA strands must be of equal length.';
        }
        return [...a].reduce((distance: number, curVal: string, index: number): number => {
            return (curVal === b[index]) ? distance : ++distance;
        }, 0);
    }
}
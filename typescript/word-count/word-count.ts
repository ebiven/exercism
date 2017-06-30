export default class Words {
    count(words: string): Map<string, number> {
        return words
            .trim()
            .toLowerCase()
            .split(/\s+/)
            .reduce(this.counter, new Map<string, number>());
    }

    counter(acc: Map<string, number>, item: string): Map<string, number> {
        const v = acc.get(item) || 0;
        acc.set(item, v+1);
        return acc;
    }
}
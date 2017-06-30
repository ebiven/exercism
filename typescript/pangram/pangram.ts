const lowerCaseLetters = [...'abcdefghijklmnopqrstuvwxyz'];

export default class Pangram {
    private sentence: string;

    constructor(sentence: string) {
        this.sentence = sentence.toLowerCase().replace(/[^a-z]/g, '')
    }

    isPangram(): boolean {
        return lowerCaseLetters.every((l) => this.sentence.includes(l));
    }
}
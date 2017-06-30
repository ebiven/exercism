export default class Bob {
    hey(message: string): string {
        if (this.isNothing(message))  { return "Fine. Be that way!"; }
        if (this.isYelling(message))  { return "Whoa, chill out!"; }
        if (this.isQuestion(message)) { return "Sure."; }
        return "Whatever.";
    }

    isQuestion(i: string): boolean { return i.endsWith('?'); }
    isNothing(i: string): boolean  { return i.trim().length == 0; }
    isYelling(i: string): boolean  { return i.toUpperCase() == i && /[A-z]/.test(i); }
}
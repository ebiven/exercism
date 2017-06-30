class WordProblem {
  private question: string;

  constructor(question: string) {
    this.question = question;
  }

  answer(): number {
    let parts = this.parse();
    if (parts.length < 3 || parts.length % 2 == 0) {
      throw new ArgumentError;
    }
    let out = parseInt(parts[0]);
    for (var x=1; x<parts.length; x=x+2) {
      let [op, r]: string[] = parts.slice(x, x+2);
      const rn = parseInt(r, 10);
      switch (op) {
        case 'plus'          : out += rn; break;
        case 'minus'         : out -= rn; break;
        case 'multiplied by' : out *= rn; break;
        case 'divided by'    : out /= rn; break;
      }
    }
    return out;
  }

  parse(): string[] {
    const r = /\-?\d+|plus|minus|divided by|multiplied by/g;
    let matches = [];
    while (true) {
      let match = r.exec(this.question);
      if (match == null) { break; }
      matches.push(match[0]);
    }
    return matches;
  }
}

class ArgumentError {}

module.exports = {
  WordProblem,
  ArgumentError
};
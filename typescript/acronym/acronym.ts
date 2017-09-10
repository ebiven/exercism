export default class Acronym {
  static parse(phrase: string): string {
    let parts = phrase.match(/[A-Z]+[a-z]*|[a-z]+/g);
    if (parts == null) { return ''; }
    return parts.reduce((acc, c) => acc += c[0].toUpperCase(), '');
  }
}

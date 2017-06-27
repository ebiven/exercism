const lowerCaseLetters = [...'abcdefghijklmnopqrstuvwxyz'];

class Pangram {
  constructor(sentence) {
    this.sentence = sentence.toLowerCase().replace(/[^a-z]/g, '')
  }

  isPangram() {
    return lowerCaseLetters.every((l) => this.sentence.includes(l));
  }
}

export default Pangram
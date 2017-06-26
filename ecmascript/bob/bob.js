class Bob {
  hey(message) {
    if (this.isNothing(message))  { return "Fine. Be that way!"; }
    if (this.isYelling(message))  { return "Whoa, chill out!"; }
    if (this.isQuestion(message)) { return "Sure."; }
    return "Whatever.";
  }

  isQuestion(i) { return i.endsWith('?'); }
  isNothing(i)  { return i.trim().length == 0; }
  isYelling(i)  { return i.toUpperCase() == i && i.match(/[A-z]/); }
}

export default Bob;

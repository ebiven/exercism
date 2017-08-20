class Isogram {
  constructor(word) {
    this.word = word.toLowerCase();
  }

  isIsogram() {
    let letters = [];
    return [...this.word]
      .reduce((pV, l) => {
        if (pV === false || letters.includes(l)) { return false; }
        if (l.match(/[^ -]/)) { letters.push(l); }
        return true;
      }, true);
  }
}

export default Isogram;

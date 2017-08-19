const LOWER_LETTERS = 'abcdefghijklmnopqrstuvwxyz';

const generateRandomKey = (len = 100) => {
  return Array(len)
    .fill(null)
    .map(() => LOWER_LETTERS[Math.floor(Math.random() * LOWER_LETTERS.length)])
    .join('');
};

class Cipher {
  constructor(key) {
    if (key != undefined && !key.match(/^[a-z]+$/)) { throw new Error("Bad key"); }
    this._key = (key) ? key : generateRandomKey();
  }

  get key() {
    return this._key;
  }

  encode(input) {
    return [...input]
      .map((c, i) => {
        let index = LOWER_LETTERS.indexOf(c) + LOWER_LETTERS.indexOf(this.key[i]);
        if (index >= LOWER_LETTERS.length) { index -= LOWER_LETTERS.length; }
        return LOWER_LETTERS[index];
      })
      .join('');
  }

  decode(input) {
    return [...input]
      .map((c, i) => {
        let index = LOWER_LETTERS.indexOf(c) - LOWER_LETTERS.indexOf(this.key[i]);
        if (index < 0) { index += LOWER_LETTERS.length; }
        return LOWER_LETTERS[index];
      })
      .join('');
  }
}

export default Cipher;

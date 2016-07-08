const Cipher = function(key) {
  if (key != undefined && !key.match(/^[a-z]+$/)) { throw new Error("Bad key"); }
  this.key = key || this.randomKey();
};

Cipher.letters = 'abcdefghijklmnopqrstuvwxyz';

Cipher.prototype.randomKey = function() {
  let out = "";
  for (var x=0; x<256; x++) {
    out += Cipher.letters[Math.floor(Math.random * Cipher.letters.length)];
  }
  return out;
};

Cipher.prototype.encode = function(input) {
  let out = [];
  [...input].forEach((c, i, arr) => {
    let index = Cipher.letters.indexOf(c) + Cipher.letters.indexOf(this.key[i]);
    if (index >= Cipher.letters.length) { index -= Cipher.letters.length; }
    out.push(Cipher.letters[index]);
  });
  return out.join('');
};

Cipher.prototype.decode = function(input) {
  let out = [];
  [...input].forEach((c, i, arr) => {
    let index = Cipher.letters.indexOf(c) - Cipher.letters.indexOf(this.key[i]);
    if (index < 0) { index += Cipher.letters.length; }
    out.push(Cipher.letters[index]);
  });
  return out.join('');
};

module.exports = Cipher;

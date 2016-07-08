const Crypto = function(input) {
  this.input = input;
};

Crypto.prototype.normalizePlaintext = function() {
  return this.input.toLowerCase().replace(/[^a-z0-9]/g, '');
};

Crypto.prototype.size = function() {
  return Math.ceil(Math.sqrt(this.normalizePlaintext(this.input).length));
};

Crypto.prototype.plaintextSegments = function() {
  let out    = [];
  let input  = this.normalizePlaintext(this.input);
  const size = this.size();

  while (input.length > 0) {
    out.push(input.slice(0, size));
    input = input.slice(size);
  }
  return out;
};

Crypto.prototype.ciphertext = function() {
  const segments = this.plaintextSegments();
  let out = "";

  for (var x=0; x<segments[0].length; x++) {
    for (var y=0; y<segments.length; y++) {
      if (segments[y][x] != undefined) {
        out += segments[y][x];
      }
    }
  }
  return out;
};

module.exports = Crypto;

export default class Crypto {
  constructor(input) {
    this.input = input;
  }

  normalizePlaintext() {
    return this.input.toLowerCase().replace(/[^a-z0-9]/g, '');
  }

  size() {
    return Math.ceil(Math.sqrt(this.normalizePlaintext(this.input).length));
  }

  plaintextSegments() {
    let out    = [];
    let input  = this.normalizePlaintext(this.input);
    const size = this.size();

    while (input.length > 0) {
      out.push(input.slice(0, size));
      input = input.slice(size);
    }
    return out;
  }

  ciphertext() {
    const segments = this.plaintextSegments();
    let out = '';

    for (var x=0; x<segments[0].length; x++) {
      for (var y=0; y<segments.length; y++) {
        if (segments[y][x] != undefined) {
          out += segments[y][x];
        }
      }
    }
    return out;
  }
}

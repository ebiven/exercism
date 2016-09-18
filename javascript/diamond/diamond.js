var Diamond = function() {};

Diamond.prototype.makeDiamond = function(letter) {
  if (letter == 'A') { return 'A\n'; }

  const dimension = (letter.charCodeAt(0) - 64) * 2 - 1;
  const midPoint  = Math.floor(dimension / 2);
  let range = [];
  for (let x = 0; x <= midPoint; x++) {
    range.push(x);
  }
  for (let x = midPoint - 1; x >= 0; x--) {
    range.push(x);
  }

  let out = '';
  range.forEach((i) => {
    a = new Array(dimension).fill(' ');
    a[midPoint - i] = String.fromCharCode(i + 65);
    a[midPoint + i] = String.fromCharCode(i + 65);
    out += a.join('') + '\n';
  });
  return out;
};

module.exports = Diamond;

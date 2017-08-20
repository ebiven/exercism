const RLE = function() {};

RLE.encode = function(input) {
  const chunk = function(acc, i) {
    const last = acc[acc.length - 1];
    if (last && last[0] === i) {
      last.push(i);
    } else {
      acc.push([i]);
    }
    return acc;
  };

  const counts = function(acc, i) {
    const len = i.length;
    acc += ((len == 1) ? '' : len.toString()) + i[0];
    return acc;
  };

  return input
    .split('')
    .reduce(chunk, [])
    .reduce(counts, '')
};

RLE.decode = function(input) {
  const expand = function(item) {
    let count = parseInt(item.substring(0, item.length - 1));
    let letter = item[item.length - 1];
    let out = letter;
    for (let x = 1; x < count; x++) {
      out += letter;
    }
    return out;
  };

  const matches = input.match(/(\d+)?(\D)/g);

  if (matches === null) { return ''; }
  return matches.map(expand).join('');
};

module.exports = RLE;

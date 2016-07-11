const Ocr = function(value) {};

Ocr.numbers = {
  ' _ | ||_|   ' : '0',
  '     |  |   ' : '1',
  ' _  _||_    ' : '2',
  ' _  _| _|   ' : '3',
  '   |_|  |   ' : '4',
  ' _ |_  _|   ' : '5',
  ' _ |_ |_|   ' : '6',
  ' _   |  |   ' : '7',
  ' _ |_||_|   ' : '8',
  ' _ |_| _|   ' : '9'
};

Ocr.convert = function(input) {
  let allRows = input.split('\n');
  let rows = [];
  for (var x=0; x<allRows.length; x=x+4) {
    rows.push(allRows.slice(x, x+4));
  }

  return rows.map((i) => Ocr.convertRow(i)).join(',');
};

Ocr.convertRow = function(rows) {
  let digits = [];
  for (var x=0; x<rows[0].length; x=x+3) {
    let digit = '';
    rows.forEach((i) => {
      digit += i.slice(x, x+3);
    });
    if (digit) { digits.push(digit); }
  }
  return digits.map((i) => {
    if (Ocr.numbers.hasOwnProperty(i)) {
      return Ocr.numbers[i];
    } else {
      return '?';
    }
  }).join('');
};

module.exports = Ocr;

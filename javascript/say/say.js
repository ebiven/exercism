module.exports = {
  inEnglish(input) {
    if (input < 0 || input > 999999999999) {
      throw new Error('Number must be between 0 and 999,999,999,999.');
    }
    // Only one reason to say zero.
    if (input == 0) { return 'zero'; }

    let parts = [];
    let sinput = input.toString();
    let iteration = 0;
    // Return an array of three part decimals to say, plus the suffix
    // say at the end of each part.
    for (var x=sinput.length; x>0; x=x-3) {
      let start = (x-3 < 0) ? 0 : x-3;
      parts.unshift({
        suffix: suffixes[iteration++],
        number: parseInt(sinput.slice(start, x), 10)
      });
    }

    let text = [];
    parts.forEach((part) => {
      // We don't need to say anything and don't want the suffix
      // later.
      if (part.number == 0) { return; }

      // Say the hundres part if we have one.
      let hundreds = Math.floor(part.number/100);
      if (hundreds > 0) {
        text.push(this.sayOnes(hundreds));
        text.push('hundred');
        part.number -= hundreds * 100;
      }

      // Say the tens part if we have one.
      let tens = Math.floor(part.number/10);
      if (tens >= 2) {
        text.push(this.sayTens(tens * 10));
        part.number -= (tens * 10);
        if (part.number > 0) {
          text.push('-');
        }
      }
      text.push(this.sayOnes(part.number));
      text.push(part.suffix);
    });

    // Stitch it all into text, hyphens pull words together.
    return text.join(' ').trim().replace(/ - /g, '-');
  },

  sayTens(input) {
    let out = '';
    tens.forEach((pair) => {
      let [n, r] = pair;
      if (n == input) { out = r; }
    });
    return out;
  },

  sayOnes(input) {
    let out = '';
    numerals.forEach((pair) => {
      let [n, r] = pair;
      if (n == input) { out = r; }
    });
    return out;
  }
};

const numerals = [
  [ 19, 'nineteen'  ],
  [ 18, 'eighteen'  ],
  [ 17, 'seventeen' ],
  [ 16, 'sixteen'   ],
  [ 15, 'fifteen'   ],
  [ 14, 'fourteen'  ],
  [ 13, 'thirteen'  ],
  [ 12, 'twelve'    ],
  [ 11, 'eleven'    ],
  [ 10, 'ten'       ],
  [  9, 'nine'      ],
  [  8, 'eight'     ],
  [  7, 'seven'     ],
  [  6, 'six'       ],
  [  5, 'five'      ],
  [  4, 'four'      ],
  [  3, 'three'     ],
  [  2, 'two'       ],
  [  1, 'one'       ]
];

const tens = [
  [ 100, 'hundred'  ],
  [  90, 'ninety'   ],
  [  80, 'eighty'   ],
  [  70, 'seventy'  ],
  [  60, 'sixty'    ],
  [  50, 'fifty'    ],
  [  40, 'forty'    ],
  [  30, 'thirty'   ],
  [  20, 'twenty'   ]
];

const suffixes = [
  '',
  'thousand',
  'million',
  'billion',
];


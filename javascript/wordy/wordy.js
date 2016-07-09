const WordProblem = function(question) {
  this.question = question;
};

WordProblem.prototype.answer = function() {
  let parts = this.parse();
  if (parts.length < 3 || parts.length % 2 == 0) {
    throw new ArgumentError();
  }

  let out = parseInt(parts[0]);
  for (var x=1; x<parts.length; x=x+2) {
    let [op, r] = parts.slice(x, x+2);
    r = parseInt(r, 10);
    switch (op) {
      case 'plus'          : out += r; break;
      case 'minus'         : out -= r; break;
      case 'multiplied by' : out *= r; break;
      case 'divided by'    : out /= r; break;
    }
  }
  return out;
};

WordProblem.prototype.parse = function() {
  const r = /\-?\d+|plus|minus|divided by|multiplied by/g;
  let matches = [];
  let match = true;
  while (true) {
    let match = r.exec(this.question);
    if (match == null) { break; }
    matches.push(match[0]);
  }
  return matches;
};

const ArgumentError = function() {
  this.name = 'ArgumentError';
  this.message = '';
};

module.exports = {
  WordProblem,
  ArgumentError
};

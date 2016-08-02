const Acronym = function() {};

Acronym.parse = function(input) {
  let parts = input.match(/[A-Z]+[a-z]*|[a-z]+/g);
  return parts.reduce((acc, c) => acc += c[0].toUpperCase(), '');
};

module.exports = Acronym;

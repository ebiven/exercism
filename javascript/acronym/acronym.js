var Acronym = function() {};

Acronym.parse = function(input) {
  let out = "";
  let parts = input.match(/[A-Z]+[a-z]*|[a-z]+/g);
  parts.forEach((part) => {
    out += part.charAt(0).toUpperCase();
  });

  return out;
};

module.exports = Acronym;

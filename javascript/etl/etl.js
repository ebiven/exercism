var ETL = function() {};

ETL.prototype.transform = function(input) {
  let out = {};
  for (key in input) {
    if (input.hasOwnProperty(key)) {
      input[key].forEach((v) => { out[v.toLowerCase()] = parseInt(key); });
    }
  }
  return out;
};

module.exports = ETL;

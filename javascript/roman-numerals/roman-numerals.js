const numerals = [
  [1000, "M" ],
  [ 900, "CM"],
  [ 500, "D" ],
  [ 400, "CD"],
  [ 100, "C" ],
  [  90, "XC"],
  [  50, "L" ],
  [  40, "XL"],
  [  10, "X" ],
  [   9, "IX"],
  [   5, "V" ],
  [   4, "IV"],
  [   1, "I" ]
];

module.exports = (input) => {
  let out = "";
  numerals.forEach((pair) => {
    let [n, r] = pair;
    let thisPass = Math.floor(input / n);
    out += r.repeat(thisPass);
    input -= thisPass * n;
  });
  return out;
};

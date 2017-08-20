const scoreMap = {
  1: "aeioulnrst",
  2: "dg",
  3: "bcmp",
  4: "fhvwy",
  5: "k",
  8: "jx",
  10: "qz",
};

let points = {};
for (let key in scoreMap) {
  if (scoreMap.hasOwnProperty(key)) {
    [...scoreMap[key]].forEach((i) => { points[i] = parseInt(key); });
  }
};

module.exports = (word) => {
  if (!word) { return 0; }
  let score = 0;
  [...word.toLowerCase()].forEach((l) => { score += points[l]; });
  return score;
};

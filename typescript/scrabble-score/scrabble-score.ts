const scoreMap: {[key: number]: string} = {
  1: "aeioulnrst",
  2: "dg",
  3: "bcmp",
  4: "fhvwy",
  5: "k",
  8: "jx",
  10: "qz",
};

let points: {[key: string]: number} = {};
for (let key in scoreMap) {
  if (scoreMap.hasOwnProperty(key)) {
    [...scoreMap[key]].forEach((i) => { points[i] = parseInt(key); });
  }
};

const score = (word: string): number => {
  if (!word) { return 0; }
  return [...word.toLowerCase()].reduce((acc, i) => acc + points[i], 0);
}

export default score;
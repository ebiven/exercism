class Hamming {
  compute(a, b) {
    // Short circuit an exact match.
    if (a === b) { return 0; }
    if (a.length !== b.length) {
      throw 'DNA strands must be of equal length.';
    }
    return [...a].reduce((distance, curVal, index) => {
      return (curVal === b[index]) ? distance : ++distance;
    }, 0);
  }
}

export default Hamming;

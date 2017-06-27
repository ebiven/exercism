class PerfectNumbers {
  classify(num) {
    if (num < 1) {
      throw 'Classification is only possible for natural numbers.';
    }
    const factors = this.getFactors(num).filter((i) => i != num);
    const sum = factors.reduce((sum, i) => sum + i, 0);
    if (num == sum) { return 'perfect'; }
    if (num <  sum) { return 'abundant'; }
    if (num >  sum) { return 'deficient'; }
    return 'foo';
  }

  // https://stackoverflow.com/a/43204663
  getFactors(num) {
    const isEven = num % 2 === 0;
    let inc = isEven ? 1 : 2;
    let factors = [1, num];

    for (let curFactor = isEven ? 2 : 3; Math.pow(curFactor, 2) <= num; curFactor += inc) {
      if (num % curFactor !== 0) continue;
      factors.push(curFactor);
      let compliment = num / curFactor;
      if (compliment !== curFactor) factors.push(compliment);
    }

    return factors;
  }
}

export default PerfectNumbers;
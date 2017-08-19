class PrimeFactors {
  for(n, result = []) {
    if (n < 2) { return []; }

    let limit = Math.sqrt(n);
    let x = 2;

    if (n % x) {
      x = 3;
      while ((n % x != 0) && ((x = x + 2) < limit)) {}
    }

    x = (x <= limit) ? x : n;
    result.push(x);

    return (x == n) ? result : this.for(n / x, result);
  }
}

export default PrimeFactors;

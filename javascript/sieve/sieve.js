const Sieve = function(limit) {
  this.primes = this.sieve(limit);
};

Sieve.prototype.sieve = function(limit) {
  limit++;
  let upperLimit = Math.sqrt(limit);
  let sieve = Array.apply(null, Array(limit)).map(() => true);
  let out = [];

  for (var i=2; i<upperLimit; i++) {
    if (sieve[i]) {
      for (var j=i*i; j<limit; j+=i) {
        sieve[j] = false;
      }
    }
  }

  for (var i=2; i<limit; i++) {
    if (sieve[i]) { out.push(i); }
  }

  return out;
};

module.exports = Sieve;

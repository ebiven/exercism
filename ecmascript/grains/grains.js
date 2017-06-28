import BigInt from './lib/big-integer.js';

class Grains {
  square(n) {
    return BigInt(2).pow(n - 1).toString();
  }

  total() {
    return BigInt(2).pow(64).subtract(1).toString();
  }
}

export default Grains;

var Palindromes = function(params) {
  this.maxFactor = params.maxFactor;
  this.minFactor = params.minFactor || 1;
  this.results = {};
};

Palindromes.prototype.generate = function() {
  for (var x=this.minFactor; x<=this.maxFactor; x++) {
    for (var y=x; y<=this.maxFactor; y++) {
      if (this.isPalindrome(x*y)) {
        if (!this.results[x*y]) {
          this.results[x*y] = { value: x*y, factors: [[x,y]] };
        } else {
          this.results[x*y].factors.push([x,y]);
        }
      }
    }
  }
};

Palindromes.prototype.largest = function() {
  let out = {value: 0};
  Object.keys(this.results).forEach((k) => {
    if (this.results[k].value > out.value) {
      out = this.results[k];
    }
  });
  return out;
};

Palindromes.prototype.smallest = function() {
  let out = {value: Number.MAX_VALUE};
  Object.keys(this.results).forEach((k) => {
    if (this.results[k].value < out.value) {
      out = this.results[k];
    }
  });
  return out;
};

Palindromes.prototype.isPalindrome = function(input) {
  input = input.toString();
  return input == input.split('').reverse().join('');
};

module.exports = Palindromes;

const Prime = function() {
};

Prime.nth = function(count) {
  if (count < 1) { throw new Error('Prime is not possible'); }
  let check = 0;
  let acc = [];
  while (true) {
    if (Prime.checker(check)) { acc.push(check); }
    if (acc.length == count) {
      return check;
    }
    check++;
  }
};

Prime.checker = function(n) {
  if (n <= 1) { return false; }
  if (n <= 3) { return true; }
  if (n % 2 == 0 || n % 3 == 0) { return false; }
  return Prime.checker2(n, 5);
};

Prime.checker2 = function(n, i) {
  if (i * i > n) { return true; }
  if (n % i == 0) { return false; }
  if (n % (i + 2) == 0) { return  false; }
  return Prime.checker2(n, i + 6);
};

module.exports = Prime;

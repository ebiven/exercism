const pairs = {
  '{' : '}',
  '[' : ']',
  '(' : ')'
};

module.exports = function(brackets) {
  let queue = [];
  [...brackets].forEach((bracket) => {
    if (pairs.hasOwnProperty(bracket)) {
      queue.push(bracket);
    } else if (pairs[queue[queue.length-1]] == bracket) {
      queue.pop();
    } else {
      queue.push(false);
    }
  });
  return queue.length == 0;
};

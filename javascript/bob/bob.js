var Bob = function() {};

Bob.prototype.hey = function(input) {
  if (this.isNothing(input))  { return "Fine. Be that way!"; }
  if (this.isYelling(input))  { return "Whoa, chill out!"; }
  if (this.isQuestion(input)) { return "Sure."; }
  return "Whatever.";
};

Bob.prototype.isQuestion = function(input) {
  return input.endsWith("?");
};

Bob.prototype.isNothing = function(input) {
  return input.trim().length == 0;
};

Bob.prototype.isYelling = function(input) {
  return input.toUpperCase() == input && input.match(/[A-z]/u);
};

module.exports = Bob;

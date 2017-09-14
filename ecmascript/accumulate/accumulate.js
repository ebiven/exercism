// Again, I could implement this by using forEach, or looping over
// the array pusing on results, or any number of other uninteresting
// solutions.
module.exports = (subject, fn) => subject.map(fn);

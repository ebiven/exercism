// I know that using filter is supposed to be off limits but filling
// a new array by looping the subject array and pushing on the items
// where fn evaluates true (keep) or false (discard) isn't
// interesting. Static methods and a negated filter are more
// educational.
export default class Strain {
  static keep(subject, fn) {
    return subject.filter(fn);
  }

  static discard(subject, fn) {
    return subject.filter(e => !fn(e));
  }
}

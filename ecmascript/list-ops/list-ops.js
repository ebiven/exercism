class List {
  constructor(arr) {
    this.values = arr || [];
  }

  append(l) {
    this.values = this.values.concat(l.values || []);
    return this;
  }

  concat(l) {
    return this.append(l);
  }

  filter(predicate) {
    this.values = this.foldl((acc, i) => {
      if (predicate(i)) { acc.push(i); }
      return acc;
    }, []);
    return this;
  }

  length() {
    return this.foldl((acc, i) => acc += 1, 0);
  }

  map(transform) {
    this.values = this.foldl((acc, i) => {
      acc.push(transform(i));
      return acc;
    }, []);
    return this;
  }

  foldl(reducer, acc) {
    this.values.forEach(i => {
      acc = reducer(acc, i);
    });
    return acc;
  }

  foldr(reducer, acc) {
    this.reverse().values.forEach(i => {
      acc = reducer(acc, i);
    });
    return acc;
  }

  reverse() {
    this.values = this.foldl((acc, i) => {
      acc.unshift(i);
      return acc;
    }, []);
    return this;
  }
}

export default List;

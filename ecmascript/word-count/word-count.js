class Words {
  counter(acc, item) {
    if (!acc.hasOwnProperty(item)) { acc[item] = 0; }
    acc[item] += 1;
    return acc;
  };

  count(words) {
    return words
      .trim()
      .toLowerCase()
      .split(/\s+/)
      .reduce(this.counter, {});
  }
}

export default Words;
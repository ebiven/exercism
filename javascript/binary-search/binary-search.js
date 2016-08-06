var BinarySearch = function(array) {
  const sortedAscending = (v, i) => {
    if (i === 0) { return true; }
    if (v < array[i - 1]) { return false; }
    return true;
  };
  if (!array.every(sortedAscending)) { return undefined; }
  this.array = array;
};

BinarySearch.prototype.indexOf = function(item) {
  let zipped = this.array.map((item, index) => [item, index]);
  return this.search(zipped, item);
};

BinarySearch.prototype.search = function(list, item) {
  if (list.length == 0) { return -1; }
  let midPoint = Math.floor(list.length/2);
  let l = list.slice(0, midPoint);
  let i = list[midPoint];
  let r = list.slice(midPoint+1);
  if (i[0] == item) { return i[1]; }
  if (i[0] >  item) { return this.search(l, item); }
  if (i[0] <  item) { return this.search(r, item); }
};

module.exports = BinarySearch;

class Sublist {
  constructor(items) {
    this.items = items || [];
  }

  compare(other) {
    if (this.sublist(this.items, other.items) && this.sublist(other.items, this.items)) {
      return 'EQUAL';
    }
    if (this.items.length == 0 || this.sublist(other.items, this.items)) {
      return 'SUBLIST';
    }
    if (other.items.length == 0 || this.sublist(this.items, other.items)) {
      return 'SUPERLIST';
    }
    return 'UNEQUAL';
  }

  sublist(l1, l2) {
    return this.arrayString(l1).includes(this.arrayString(l2));
  }

  arrayString(i) {
    return `,${i.join(',')},`;
  }
}

export default Sublist;

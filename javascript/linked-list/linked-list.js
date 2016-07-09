const Node = function(value, prev, next) {
  this.value = value;
  this.prev = prev || null;
  this.next = next || null;
};

const LinkedList = function() {
  this.head = null;
  this.tail = null;
};

LinkedList.prototype.push = function(value) {
  if (this.tail == null) {
    this.head = new Node(value);
    this.tail = this.head;
  } else {
    let n = new Node(value, this.tail);
    this.tail.next = n;
    this.tail = n;
  }
};

LinkedList.prototype.pop = function() {
  let tailValue = this.tail.value;
  this.tail = this.tail.prev;
  return tailValue;
};

LinkedList.prototype.shift = function() {
  let headValue = this.head.value;
  this.head = this.head.next;
  return headValue;
};

LinkedList.prototype.unshift = function(value) {
  if (this.head == null) {
    this.head = new Node(value);
    this.tail = this.head;
  } else {
    let n = new Node(value, null, this.head);
    this.head.prev = n;
    this.head = n;
  }
};

LinkedList.prototype.count = function() {
  let out = 0;
  let i = this.head;
  while (i != null) {
    out++;
    i = i.next;
  }
  return out;
};

LinkedList.prototype.delete = function(value) {
  let i = this.head;
  while (i != null) {
    if (i.value == value) {
      if (i.prev) { i.prev.next = i.next; }
      if (i.next) { i.next.prev = i.prev; }
      if (i == this.head) { this.head = null; }
      if (i == this.tail) { this.tail = i.prev;  }
      break;
    }
    i = i.next;
  }
};

module.exports = LinkedList;

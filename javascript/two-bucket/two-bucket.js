const TwoBucket = function(size1, size2, goal, start) {
  let bucket1    = new Bucket(size1, 'one');
  let bucket2    = new Bucket(size2, 'two');
  this.goal      = goal;
  this.moveCount = 1;
  this.goalBucket;
  this.otherBucket;

  if (start == 'one') {
    bucket1.fill();
    this.start(bucket1, bucket2);
  } else {
    bucket2.fill();
    this.start(bucket2, bucket1);
  }
};

TwoBucket.prototype.checkComplete = function(bucket1, bucket2) {
  if (bucket1.contains == this.goal) {
    this.goalBucket = bucket1.id;
    this.otherBucket = bucket2.contains;
    return true;
  }
  if (bucket2.contains == this.goal) {
    this.goalBucket = bucket2.id;
    this.otherBucket = bucket1.contains;
    return true;
  }
  return false;
};

TwoBucket.prototype.moves = function() {
  return this.moveCount;
};

TwoBucket.prototype.start = function(bucket1, bucket2) {
  while (true) {
    if (this.checkComplete(bucket1, bucket2)) {
      break;
    }
    if (this.moves == 0)                                { bucket1.pour(bucket2); }
    else if (bucket1.isEmpty())                         { bucket1.fill(); }
    else if (bucket1.isFull() && bucket2.isPartFull())  { bucket1.pour(bucket2); }
    else if (bucket2.isFull())                          { bucket2.empty(); }
    else if (bucket2.isEmpty() && bucket1.isPartFull()) { bucket1.pour(bucket2); }
    this.moveCount++;
  }
};

const Bucket = function(size, id) {
  this.size     = size;
  this.contains = 0;
  this.id       = id;
};
Bucket.prototype.fill       = function() { this.contains = this.size; };
Bucket.prototype.empty      = function() { this.contains = 0; };
Bucket.prototype.isFull     = function() { return this.contains == this.size; }
Bucket.prototype.isPartFull = function() { return this.contains > 0; }
Bucket.prototype.isEmpty    = function() { return this.contains == 0; }
Bucket.prototype.pour       = function(target) {
  let amountToTransfer = Math.min(target.size - target.contains, this.contains);
  target.contains += amountToTransfer;
  this.contains -= amountToTransfer;
};

module.exports = TwoBucket;

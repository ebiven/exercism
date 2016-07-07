function BufferEmptyException() {
  this.name = 'BufferEmptyException';
  this.message = 'Buffer is empty.';
};

function BufferFullException() {
  this.name = 'BufferFullException';
  this.message = 'Buffer is full.';
};

function cleanBuffer(size) {
  return Array.apply(null, Array(size)).map(function () { return null; });
};

function CircularBuffer(size) {
  let readPosition = 0;
  let writePosition = 0;
  let buffer = cleanBuffer(size);

  const isEmpty = () => {
    return buffer.every((i) => { return i == null});
  };

  const isFull = () => {
    return buffer.every((i) => { return i != null });
  };

  const movePosition = (type) => {
    switch (type) {
      case 'w':
        writePosition = (writePosition + 1) % buffer.length;
        break;
      case 'r':
        readPosition = (readPosition + 1) % buffer.length;
        break;
    }
  }

  return {
    read: () => {
      if (isEmpty()) { throw new BufferEmptyException(); }
      let val = buffer[readPosition];
      buffer[readPosition] = null;
      movePosition('r');
      return val;
    },

    write: (val) => {
      if (val == null || val == undefined) { return; }
      if (isFull()) { throw new BufferFullException(); }
      buffer[writePosition] = val;
      movePosition('w');
    },

    forceWrite: (val) => {
      if (val == null || val == undefined) { return; }
      if (isFull()) {
        movePosition('r');
      }
      buffer[writePosition] = val;
      movePosition('w');
    },

    clear: () => {
      readPosition = 0;
      writePosition = 0;
      buffer = cleanBuffer(size);
    }
  }
}

module.exports = {
  bufferEmptyException: () => { return new BufferEmptyException(); },
  bufferFullException: () => { return new BufferFullException(); },
  circularBuffer: (size) => { return new CircularBuffer(size); },
};

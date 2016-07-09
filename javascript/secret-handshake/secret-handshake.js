const SecretHandshake = function(flags) {
  if (typeof flags != 'number') {
    throw new Error('Handshake must be a number');
  }
  this.flags = flags;
};

SecretHandshake.prototype.commands = function() {
  const items = {
    'wink'            : 1,
    'double blink'    : 2,
    'close your eyes' : 4,
    'jump'            : 8,
  };
  let out = [];
  Object.keys(items).forEach((k) => {
    if (items[k] & this.flags) { out.push(k); }
  });
  if (this.flags & 16) { out.reverse(); }
  return out;
};

module.exports = SecretHandshake;

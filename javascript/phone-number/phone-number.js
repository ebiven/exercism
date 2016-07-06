var PhoneNumber = function(raw) {
  raw = raw.replace(/[^0-9]/g, '');
  if (raw.length == 11 && raw.startsWith('1')) {
    raw = raw.slice(1);
  }
  if (raw.length == 10) {
    this.phoneNumber = raw;
  } else {
    this.phoneNumber = '0000000000';
  }
};

PhoneNumber.prototype.number = function() {
  return this.phoneNumber;
};

PhoneNumber.prototype.areaCode = function() {
  return this.phoneNumber.slice(0,3);
};

PhoneNumber.prototype.officeCode = function() {
  return this.phoneNumber.slice(3,6);
};

PhoneNumber.prototype.customerCode = function() {
  return this.phoneNumber.slice(6);
};

PhoneNumber.prototype.toString = function() {
  return `(${this.areaCode()}) ${this.officeCode()}-${this.customerCode()}`;
};

module.exports = PhoneNumber;

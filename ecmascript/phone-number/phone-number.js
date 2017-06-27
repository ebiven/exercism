const cleanRawPhoneNumber = (n) => n.replace(/[ ()\.-]/g, '').trim();
const onlyDigits = (n) => n.match(/^[0-9]+$/);
const stripCountryCode = (n) => {
  if (n.length == 11 && n.startsWith('1')) {
    return n.slice(1);
  }
  return n;
};

class PhoneNumber {
  constructor(raw) {
    let formatted = cleanRawPhoneNumber(raw);
    formatted = stripCountryCode(formatted);
    if (!onlyDigits(formatted) || formatted.length != 10) { formatted = null; }
    this.formatted = formatted;
  }

  number() {
    return this.formatted;
  }
}

export default PhoneNumber;

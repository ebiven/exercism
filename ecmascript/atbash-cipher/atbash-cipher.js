const generateAtbashKey = () => {
  let out = {};
  const forward = "abcdefghijklmnopqrstuvwxyz0123456789";
  const backward = "zyxwvutsrqponmlkjihgfedcba0123456789";

  for (var x=0; x<forward.length; x++) {
    out[forward.charAt(x)] = backward.charAt(x);
  }
  return out;
};
const atbashKey = generateAtbashKey();

export default class AtbashCipher {
  static encode(subject) {
    subject = subject.toLowerCase().replace(/[^a-z0-9]/, "");
    subject = [...subject].map((char) => atbashKey[char]).join('');
    for (var x=5,i=0; x<subject.length; x=x+5) {
      subject = subject.slice(0, x+i) + " " + subject.slice(x+i);
      i++;
    }
    return subject.trim();   return input;
  }
}

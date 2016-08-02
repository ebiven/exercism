var Pangram = function(sentence) {
  this.sentence = sentence.toLowerCase().replace(/[^a-z]/g, '').split('');
};

Pangram.prototype.isPangram = function() {
  return "abcdefghijklmnopqrstuvwxyz".split('').every((l) => {
    return this.sentence.some((m) => m == l)
  });
  //let letters = [];
  //[...this.sentence]
    //.forEach((l) => {
      //if (!letters.includes(l)) {
        //letters.push(l);
      //}
    //});
  //return letters.length == 26;
};

module.exports = Pangram;

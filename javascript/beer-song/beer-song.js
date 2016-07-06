var BeerSong = function() {};

BeerSong.prototype.phrase0 = function() { return "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n" };
BeerSong.prototype.phrase1 = function() { return "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n" };
BeerSong.prototype.phraseN = function(n) { return `${n} bottles of beer on the wall, ${n} bottles of beer.\nTake one down and pass it around, ${n - 1} bottle${n - 1 == 1 ? '' : 's'} of beer on the wall.\n` };

BeerSong.prototype.verse = function(number) {
  switch (number) {
    case 0: return this.phrase0();
    case 1: return this.phrase1();
    default: return this.phraseN(number);
  }
};

BeerSong.prototype.sing = function(start, end = 0) {
  let out = [];
  for (var x = start; x >= end; x--) {
    out.push(this.verse(x));
  }
  return out.join("\n");
};

module.exports = BeerSong;

const phrase0 = () => { return "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n" };
const phrase1 = () => { return "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n" };
const phraseN = (n) => { return `${n} bottles of beer on the wall, ${n} bottles of beer.\nTake one down and pass it around, ${n - 1} bottle${n - 1 == 1 ? '' : 's'} of beer on the wall.\n` };

class Beer {
  static verse(number) {
    switch (number) {
      case 0: return phrase0();
      case 1: return phrase1();
      default: return phraseN(number);
    }
  }

  static sing(start = 99, end = 0) {
    let out = [];
    for (var x = start; x >= end; x--) {
      out.push(this.verse(x));
    }
    return out.join("\n");
  };
}

export default Beer;
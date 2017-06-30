const phrase0 = (): string => { return "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n" };
const phrase1 = (): string => { return "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n" };
const phraseN = (n: number): string => { return `${n} bottles of beer on the wall, ${n} bottles of beer.\nTake one down and pass it around, ${n - 1} bottle${n - 1 == 1 ? '' : 's'} of beer on the wall.\n` };

export default class Beer {
  static verse(number: number): string {
    switch (number) {
      case 0: return phrase0();
      case 1: return phrase1();
      default: return phraseN(number);
    }
  }

  static sing(start = 99, end = 0): string {
    let out = [];
    for (var x = start; x >= end; x--) {
      out.push(this.verse(x));
    }
    return out.join("\n");
  };
}
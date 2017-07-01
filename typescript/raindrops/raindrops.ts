export default class Raindrops {
  convert(n: number): string {
    let out = "";
    if (n % 3 == 0) { out += "Pling"; }
    if (n % 5 == 0) { out += "Plang"; }
    if (n % 7 == 0) { out += "Plong"; }
    if (out.length == 0) { out = n.toString(); }
    return out;
  }
}
let usedNames = new Set<string>();
const letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const numbers = "0123456789";

export default class RobotName {
  private _name: string;

  constructor() {
    this._name = this.generateName();
  }

  get name(): string {
    return this._name;
  }

  resetName(): void {
    this._name = this.generateName();
  }

  private randomFromSet(set: string, numberOf: number): string {
    return [...Array(numberOf).keys()].reduce((acc) => {
      acc.push(set.charAt(Math.floor(Math.random() * set.length)));
      return acc;
    }, new Array<string>()).join('');
  }

  private generateName(): string {
    let n = '';
    do {
      n = `${this.randomFromSet(letters, 2)}${this.randomFromSet(numbers, 3)}`;
    } while (usedNames.has(n))
    usedNames.add(n);
    return n;
  }
}
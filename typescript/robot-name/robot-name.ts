export default class RobotName {
  private static usedNames = new Set<string>();
  private static letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  private static numbers = "0123456789";

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
      n = `${this.randomFromSet(RobotName.letters, 2)}${this.randomFromSet(RobotName.numbers, 3)}`;
    } while (RobotName.usedNames.has(n))
    RobotName.usedNames.add(n);
    return n;
  }
}
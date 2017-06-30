export default class Squares {
  private to: number[];

  constructor(to: number) {
    this.to = [...Array(to + 1).keys()];
  }

  get squareOfSums(): number {
    return Math.pow(this.to.reduce((acc, i) => acc + i), 2);
  }

  get sumOfSquares(): number {
    return this.to.reduce((acc, i) => acc + i**2); 
  }

  get difference(): number {
    return this.squareOfSums - this.sumOfSquares;
  }
}
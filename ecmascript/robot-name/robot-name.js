let usedNames = {};
const letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const numbers = "0123456789";

const generateName = () => {
  let n = '';
  do {
    n = `${randomFromSet(letters, 2)}${randomFromSet(numbers, 3)}`;
  } while (usedNames.hasOwnProperty(n))
  return n;
};

const randomFromSet = (set, numberOf = 1) => {
  return [...Array(numberOf).keys()].reduce((acc, i) => {
    acc.push(set.charAt(Math.floor(Math.random() * set.length)));
    return acc;
  }, []).join('');
};

class Robot {
  constructor() {
    this.newName();
  }

  get name() {
    return this._name;
  }

  reset() {
    this.newName();
  }

  newName() {
    this._name = generateName();
    usedNames[this._name] = true;
  }
}

export default Robot;
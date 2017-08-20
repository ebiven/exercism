const ALLERGENS = [
  "eggs",
  "peanuts",
  "shellfish",
  "strawberries",
  "tomatoes",
  "chocolate",
  "pollen",
  "cats"
];

class Allergies {
  constructor(flags) {
    this.flags = flags;
  }

  list() {
    return ALLERGENS.filter((k) => this.allergicTo(k));
  }

  allergicTo(item) {
    return (this.flags & 1 << ALLERGENS.indexOf(item)) != 0;
  }
}

export default Allergies;

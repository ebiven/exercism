const Allergies = function(flags) {
  this.flags = flags;
};

Allergies.allergens = [
  "eggs",
  "peanuts",
  "shellfish",
  "strawberries",
  "tomatoes",
  "chocolate",
  "pollen",
  "cats"
];

Allergies.prototype.list = function() {
  return Allergies.allergens.filter((k) => this.allergicTo(k));
};

Allergies.prototype.allergicTo = function(item) {
  return (this.flags & 1 << Allergies.allergens.indexOf(item)) != 0;
};

module.exports = Allergies;

const Allergies = function(flags) {
  this.flags = flags;
};

Allergies.allergens = {
  "eggs"         : 1,
  "peanuts"      : 2,
  "shellfish"    : 4,
  "strawberries" : 8,
  "tomatoes"     : 16,
  "chocolate"    : 32,
  "pollen"       : 64,
  "cats"         : 128
}

Allergies.prototype.list = function() {
  return Object.keys(Allergies.allergens).filter((k) => this.allergicTo(k));
};

Allergies.prototype.allergicTo = function(item) {
  return (Allergies.allergens[item] & this.flags) != 0;
};

module.exports = Allergies;

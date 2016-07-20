class Allergies
  def initialize(flags)
    @flags = flags
  end

  def allergic_to?(item)
    @@allergens[item] & @flags != 0
  end

  def list
    @@allergens.each_with_object([]) { |(k,v), acc| acc.push(k) if v & @flags != 0 }
  end

  @@allergens = {
    "eggs"         => 1,
    "peanuts"      => 2,
    "shellfish"    => 4,
    "strawberries" => 8,
    "tomatoes"     => 16,
    "chocolate"    => 32,
    "pollen"       => 64,
    "cats"         => 128
  }
end

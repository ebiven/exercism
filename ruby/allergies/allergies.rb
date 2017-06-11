class Allergies

  @@allergens = %w(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)

  def initialize(flags)
    @flags = flags
  end

  def allergic_to?(item)
    0 != @flags & 1 << @@allergens.find_index(item)
  end

  def list
    @@allergens.select { |i| allergic_to?(i) }
  end
end

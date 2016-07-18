class SpaceAge
  attr_reader :seconds
  def initialize(age)
    @seconds = age
  end

  {
    on_mercury: 7_600_530.24,
    on_venus:   19_413_907.2,
    on_earth:   31_558_149.76,
    on_mars:    59_354_294.4,
    on_jupiter: 374_335_776.0,
    on_saturn:  929_596_608.0,
    on_uranus:  2_661_041_808.0,
    on_neptune: 5_200_418_592.0
  }.each do |planet, factor|
    define_method(planet) do
      @seconds / factor
    end
  end
end

# The differently named scales don't seem to have anything to do
# with the exercise.
class Scale
  attr_reader :name, :pitches

  SCALE      = %w(A A# B C C# D D# E F F# G G#)
  FLAT_SCALE = %w(C Db D Eb E F Gb G Ab A Bb B)
  FLAT_KEYS  = %w(F Bb Eb Ab Db Gb d g c f bb eb)
  INTERVALS  = %w(m M A)

  def initialize(tonic, scale_name, pattern=false)
    @tonic      = tonic.capitalize
    @scale_name = scale_name
    @pattern    = pattern
    @name       = "#{@tonic} #{@scale_name}"
    @scale      = FLAT_KEYS.include?(tonic) ? FLAT_SCALE : SCALE
    @pitches    = @scale.rotate(@scale.index(@tonic))
    if @pattern
      pi = 0
      @pitches = @pattern.chars.each_with_object([]) do |p, acc|
        acc.push(@pitches[pi])
        pi += INTERVALS.index(p) + 1
      end
    end
  end
end

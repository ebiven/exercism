class SecretHandshake
  def initialize(flags)
    @flags = (flags.is_a? Integer) ? flags : 0
  end

  def commands
    out = @@items.each_with_object([]) do |(k,v), acc|
      acc.push(k) if (v & @flags) != 0
    end
    out.reverse! if (16 & @flags) != 0
    out
  end

  @@items = {
    'wink'            => 1,
    'double blink'    => 2,
    'close your eyes' => 4,
    'jump'            => 8
  }
end

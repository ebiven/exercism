class Robot
  @@taken_names = {}

  def reset
    @name = nil
  end

  def name
    @name ||= get_unique_name
  end

  private

  def get_unique_name
    name = ''
    # This is an arbitrary length, but we don't want to let this go on
    # forever in case all possible names are taken.
    999.times do
      name = make_name
      if !@@taken_names[name]
        @@taken_names[name] = name
        break
      end
    end
    name
  end

  def make_name
    letters = ('A'..'Z').to_a.sample(2).join('')
    numbers = (0..9).to_a.sample(3).join('')
    "#{letters}#{numbers}"
  end
end

module BookKeeping
  VERSION = 2
end

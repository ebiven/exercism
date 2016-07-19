module Brackets
  @@pairs = {
    '{' => '}',
    '[' => ']',
    '(' => ')'
  }

  @@brackets_only = /[^\[\{\(\]\}\)]/

  def self.paired?(input)
    queue = []
    input.gsub(@@brackets_only, '').chars do |b|
      if @@pairs.keys.include?(b)
        queue.push(b)
      elsif @@pairs[queue.last] == b
        queue.pop
      else
        queue.push(nil)
      end
    end
    queue.length == 0
  end
end

module BookKeeping
  VERSION = 2
end

module RunLengthEncoding
  def self.encode(input)
    input.chars.chunk { |i| i }.each_with_object('') do |item, acc|
      if item[1].length == 1
        acc << item[0]
      else
        acc << "#{item[1].length}#{item[0]}"
      end
    end
  end

  def self.decode(input)
    input.scan(/(\d+)?(\D)/).each_with_object('') do |item, acc|
      if item[0].to_i > 1
        acc << item[1]*item[0].to_i
      else
        acc << item[1]
      end
    end
  end
end

module BookKeeping
  VERSION = 2
end

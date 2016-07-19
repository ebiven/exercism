class FlattenArray
  VERSION = 1

  def self.flatten(input, out=[])
    input.each do |i|
      if i.kind_of?(Array)
        flatten(i, out)
      else
        out.push(i) if i != nil
      end
    end
    out
  end
end

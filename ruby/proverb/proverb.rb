class Proverb
  @phrase = ""

  def initialize(*items, qualifier: false)
    pairs = (0..items.length-2).each_with_object([]) do |i, acc|
      acc.push(items.slice(i, 2))
    end
    @phrase = pairs
      .map { |(i,j)| "For want of a #{i} the #{j} was lost." }
      .join("\n")
    want_of = (qualifier) ? "#{qualifier} #{items.first}" : "#{items.first}"
    @phrase += ("\nAnd all for the want of a #{want_of}.")
  end

  def to_s
    @phrase
  end
end

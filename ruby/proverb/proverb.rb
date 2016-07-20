class Proverb
  @phrase = ""

  def initialize(*items, qualifier: false)
    @phrase = items.each_cons(2)
      .map { |(i,j)| "For want of a #{i} the #{j} was lost." }
      .join("\n")
    want_of = (qualifier) ? "#{qualifier} #{items.first}" : "#{items.first}"
    @phrase += ("\nAnd all for the want of a #{want_of}.")
  end

  def to_s
    @phrase
  end
end

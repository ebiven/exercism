module ETL
  def self.transform(input)
    input.each_with_object({}) do |(k,vs), acc|
      vs.each { |v| acc[v.downcase] = k }
    end
  end
end

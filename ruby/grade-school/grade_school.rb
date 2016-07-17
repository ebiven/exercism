class School
  def initialize
    @roster = Hash.new { |h,k| h[k] = [] }
  end

  def students(grade)
    @roster[grade]
  end

  def students_by_grade
    @roster.keys.sort.map { |i| {grade: i, students: @roster[i]} }
  end

  def add(name, grade)
    @roster[grade].push(name).sort!
  end
end

module BookKeeping
  VERSION = 3
end

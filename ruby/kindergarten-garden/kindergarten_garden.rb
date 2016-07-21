class Garden
  def initialize(garden, students=@@students)
    garden = garden.split("\n").map do |row|
      row.split('').map { |l| @@plants[l] }
    end
    @garden = {}
    students.sort.each_with_index do |student, i|
      gi = i * 2
      @garden[student.downcase.to_sym] =
        [garden[0][gi], garden[0][gi+1], garden[1][gi], garden[1][gi+1]]
    end
  end

  def method_missing(student)
    @garden[student]
  end

  @@plants = {
    clover:   'C',
    grass:    'G',
    radishes: 'R',
    violets:  'V'
  }.invert

  @@students = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
    'Fred',
    'Ginny',
    'Harriet',
    'Ileana',
    'Joseph',
    'Kincaid',
    'Larry'
  ]
end

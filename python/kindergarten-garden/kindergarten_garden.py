PLANTS   = { 'C': 'Clover', 'G': 'Grass', 'R': 'Radishes', 'V': 'Violets' }
STUDENTS = [ 'Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Fred', 'Ginny', 'Harriet', 'Ileana', 'Joseph', 'Kincaid', 'Larry' ]

class Garden(object):
    def __init__(self, garden, students=STUDENTS):
        garden = [[PLANTS[q] for q in p] for p in garden.split()]
        garden_length = len(garden[0]) // 2

        students.sort()
        self.student_garden = {}
        for i, student in enumerate(students[:garden_length]):
            garden_index = i*2
            self.student_garden[student] = [
                garden[0][garden_index],
                garden[0][garden_index+1],
                garden[1][garden_index],
                garden[1][garden_index+1]
            ]

    def plants(self, student):
        return self.student_garden[student]

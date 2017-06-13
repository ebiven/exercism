NORTH, EAST, SOUTH, WEST = [0, 1, 2, 3]

class Robot(object):
    def __init__(self, bearing=NORTH, x=0, y=0):
        self.bearing = bearing
        self.x = x
        self.y = y

    def turn_left(self):
        self.bearing = (self.bearing - 1) % 4

    def turn_right(self):
        self.bearing = (self.bearing + 1) % 4

    def advance(self):
        if self.bearing == NORTH:
            self.y += 1
        if self.bearing == SOUTH:
            self.y -= 1
        if self.bearing == EAST:
            self.x += 1
        if self.bearing == WEST:
            self.x -= 1

    def simulate(self, path):
        for item in path:
            if item == 'A':
                self.advance()
            if item == 'L':
                self.turn_left()
            if item == 'R':
                self.turn_right()

    @property
    def coordinates(self):
        return (self.x, self.y)

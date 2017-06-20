class SpaceAge(object):
    def __init__(self, seconds):
        self.seconds = seconds


    def converter(period):
        def inner(self):
            return round(self.seconds/period, 2)

        return inner


    on_earth   = converter(31558149.76)
    on_jupiter = converter(374335776.0)
    on_mars    = converter(59354294.4)
    on_mercury = converter(7600530.24)
    on_neptune = converter(5200418592.0)
    on_saturn  = converter(929596608.0)
    on_uranus  = converter(2661041808.0)
    on_venus   = converter(19413907.2)

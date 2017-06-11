class Allergies(object):

    _allergens = [
        'eggs',
        'peanuts',
        'shellfish',
        'strawberries',
        'tomatoes',
        'chocolate',
        'pollen',
        'cats'
    ]

    def __init__(self, flags):
        self.flags = flags

    def is_allergic_to(self, item):
        return self.flags & 1 << self._allergens.index(item)

    @property
    def lst(self):
        return filter(lambda a: self.is_allergic_to(a), self._allergens)

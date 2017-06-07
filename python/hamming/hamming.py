def distance(strand1, strand2):
    if len(strand1) != len(strand2):
        raise ValueError

    zipped = zip(strand1, strand2)
    return sum(1 for [a, b] in zipped if a != b)

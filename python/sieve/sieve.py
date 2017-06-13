def sieve(limit):
    if limit < 2:
        return []

    candidates = range(2, limit+1)

    for i in candidates:
        candidates = list(filter(lambda x: x == i or x % i != 0, candidates))

    return candidates

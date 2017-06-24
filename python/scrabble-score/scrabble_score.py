# Human-readable score map.
SCORE_MAP = {
    1  : 'aeioulnrst',
    2  : 'dg',
    3  : 'bcmp',
    4  : 'fhvwy',
    5  : 'k',
    8  : 'jx',
    10 : 'qz'
}
# Transposed for easier scoring.
POINTS = { v: k for k, vs in SCORE_MAP.items() for v in vs }

def score(word):
    return sum(POINTS[l] for l in word.lower())

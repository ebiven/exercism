VOWEL_SOUNDS   = ['a', 'e', 'i', 'o', 'u']
CONSONANT_SETS = ['ch', 'th', 'thr', 'sch', 'qu', 'squ']
NON_STARTERS   = ['yt', 'xr']

def translate(words):
    output = []

    for word in words.split(' '):
        start_letters = 1

        c = False
        for vs in VOWEL_SOUNDS:
            if word.startswith(vs):
                output.append("%say" % (word))
                c = True

        if c: continue

        for cs in CONSONANT_SETS:
            if word.startswith(cs):
                start_letters = len(cs)

        for ns in NON_STARTERS:
            if word.startswith(ns):
                start_letters = 0

        output.append("%s%say" % (word[start_letters:], word[:start_letters]))

    return ' '.join(output)
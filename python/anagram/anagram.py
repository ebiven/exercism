def detect_anagrams(word, candidates):
    def parse(w):
        return [w.lower(), sorted(list(w.lower()))]

    word, sorted_word = parse(word)

    def is_anagram(candidate):
        candidate, sorted_candidate = parse(candidate)
        return word != candidate and sorted_word == sorted_candidate

    return filter(is_anagram, candidates)

def is_isogram(word):
    word = filter(str.isalpha, word.lower())
    return len(word) == len(set(word))
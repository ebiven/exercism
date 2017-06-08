import re
from collections import Counter

def word_count(sentence):
    cleaned_sentence = re.sub('[^a-zA-Z0-9]', ' ', sentence.lower())
    return Counter(cleaned_sentence.split())

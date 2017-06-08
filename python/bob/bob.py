import re

def hey(phrase):
    phrase = phrase.strip()
    if phrase.isupper():     return 'Whoa, chill out!'
    if phrase.endswith('?'): return 'Sure.'
    if len(phrase) == 0:     return 'Fine. Be that way!'
    return 'Whatever.'

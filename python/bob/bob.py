import re

def hey(phrase):
    phrase = phrase.strip()

    if is_yelling(phrase):  return 'Whoa, chill out!'
    if is_question(phrase): return 'Sure.'
    if is_nothing(phrase):  return 'Fine. Be that way!'
    return 'Whatever.'

def is_yelling(phrase):
    return phrase.upper() == phrase and re.search('[A-Z]', phrase)

def is_question(phrase):
    return phrase.endswith('?')

def is_nothing(phrase):
    return len(phrase) == 0

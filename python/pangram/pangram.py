import string

def is_pangram(input):
    lower_input = input.lower()
    return all(l in lower_input for l in string.ascii_lowercase)
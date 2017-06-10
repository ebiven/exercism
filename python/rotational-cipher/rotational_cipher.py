from re import sub
from string import ascii_lowercase
from string import ascii_uppercase

NUM_LETTERS = len(ascii_lowercase)

def rotate(text, degrees):
    # Building this dictionary is almost certainly a preoptimization given the
    # lengths of the test inputs.
    rotate_dict = {}
    for l in ascii_lowercase:
        rotated_index = (ascii_lowercase.index(l) + degrees) % NUM_LETTERS
        rotate_dict[l] = ascii_lowercase[rotated_index]
    for l in ascii_uppercase:
        rotated_index = (ascii_uppercase.index(l) + degrees) % NUM_LETTERS
        rotate_dict[l] = ascii_uppercase[rotated_index]

    return sub(r'(.)', lambda l: rotate_dict.get(l.group(1), l.group(1)), text)

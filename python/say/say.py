NUMBERS = {
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
    10: 'ten',
    11: 'eleven',
    12: 'twelve',
    13: 'thirteen',
    14: 'fourteen',
    15: 'fifteen',
    16: 'sixteen',
    17: 'seventeen',
    18: 'eighteen',
    19: 'nineteen',
    20: 'twenty',
    30: 'thirty',
    40: 'forty',
    50: 'fifty',
    60: 'sixty',
    70: 'seventy',
    80: 'eighty',
    90: 'ninty'
}

CHUNKS = [
    # { 'word': 'trillion', 'number': 1e12 },
    { 'word': 'billion', 'number': 1e9 },
    { 'word': 'million', 'number': 1e6 },
    { 'word': 'thousand', 'number': 1e3 },
    { 'word': '', 'number': 1e0 }
]

def say(number):
    if number < 0 or number >= 1e12:
        raise AttributeError

    if number == 0:
        return 'zero'

    number_string = ''
    say_and = False

    for c in CHUNKS:
        part = number // c['number']
        if part > 0:
            number_string += say_triplet(part) + ' ' + c['word'] + ' '
        else:
            if len(number_string) > 1:
                say_and = True

        number -= part * c['number']

        if number > 0 and len(number_string) > 0 and say_and:
            number_string += 'and '
            say_and = False

    return number_string.strip()


def say_triplet(number):
    number_string = ''
    seperator = ' '
    hundreds_part = number//100

    if hundreds_part > 0:
        number_string += say_triplet(hundreds_part) + ' hundred'
        number = number - hundreds_part * 100
        if number > 0:
            number_string += ' and'

    while number > 0:
        largest_part = max([i for i in NUMBERS.keys() if i <= number])

        number_string += seperator + NUMBERS[largest_part]

        if 20 <= largest_part <= 90:
            seperator = '-'
        else:
            seperator = ' '

        number -= largest_part

    return number_string.strip()
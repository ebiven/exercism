from itertools import groupby
from re import sub

def decode(string):
    def decode_part(part):
        return part.group(2) * int(part.group(1))

    return sub(r'(\d+)(\D)', decode_part, string)


def encode(string):
    def encode_part(k,g):
        length = len(list(g))
        return '%s%s' % (length if length > 1 else '', k)

    return ''.join(encode_part(k,g) for k,g in groupby(string))

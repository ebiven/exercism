import re, math, itertools

def encode(string):
    if not string:
        return ''

    string = re.sub(r'[^0-9a-z]', '', string.lower())
    size   = math.ceil(math.sqrt(len(string)))
    split  = [ string[i:i+size] for i in range(0, len(string), size) ]
    return ' '.join([''.join(c)
                     for c in itertools.zip_longest(*split, fillvalue='')])

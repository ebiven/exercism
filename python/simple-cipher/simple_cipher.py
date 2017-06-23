from re import sub
import random, string

class Cipher(object):
    def __init__(self, key=None):
        if key is None:
            key = ''.join(random.choice(string.ascii_lowercase) for i in range(100))

        if any(l not in string.ascii_lowercase for l in key):
            raise ValueError

        self.key = key
        self.key_bytes = self.get_bytes(key)


    def encode(self, text):
        text = self.clean(text)
        the_bytes = self.get_bytes(text)
        out = [(b + self.key_bytes[i % len(self.key_bytes)]) % 26 for i, b in enumerate(the_bytes)]
        return self.get_string(out)


    def decode(self, text):
        the_bytes = self.get_bytes(text)
        out = [(b - self.key_bytes[i % len(self.key_bytes)]) % 26 for i, b in enumerate(the_bytes)]
        return self.get_string(out)


    def clean(self, text):
        return sub(r'[^a-z]', '', text.lower())


    def get_string(self, the_bytes):
        return ''.join([chr(b + 97) for b in the_bytes])


    def get_bytes(self, text):
        return [ord(letter) - 97 for letter in text]


def Caesar():
    return Cipher('d')
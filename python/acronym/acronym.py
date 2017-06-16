import re

def abbreviate(text):
    parts = re.findall(r'[A-Z]+[a-z]*|[a-z]+', text)
    return ''.join([i[0].upper() for i in parts])
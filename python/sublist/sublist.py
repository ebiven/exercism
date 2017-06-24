EQUAL     = 0
SUBLIST   = 1
SUPERLIST = 2
UNEQUAL   = 3

def check_lists(l1, l2):
    if l1 == l2:
        return EQUAL
    if sublist(l1, l2):
        return SUBLIST
    if sublist(l2, l1):
        return SUPERLIST
    return UNEQUAL


def sublist(l1, l2):
    return any(l1 == l2[i:i+len(l1)]
            for i in range(0, len(l2) - len(l1) + 1))

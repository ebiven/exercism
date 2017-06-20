def flatten(i):
    o = []
    for x in i:
        if isinstance(x, (list, tuple)):
            o += flatten(x)
        elif x is not None:
            o.append(x)

    return o
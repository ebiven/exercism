def transform(i):
    o = {}
    for k, v in i.items():
        for vi in v:
            o[vi.lower()] = k

    return o
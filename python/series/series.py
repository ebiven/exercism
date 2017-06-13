def slices(source, size):
    if len(source) < size or size < 1:
        raise ValueError

    source = list(map(int, source))
    return [source[i:i+size] for i in range(len(source)-size+1)]

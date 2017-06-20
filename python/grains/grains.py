def on_square(num):
    if num < 1 or num > 64:
        raise ValueError

    return 2**(num - 1)


def total_after(num):
    if num < 1 or num > 64:
        raise ValueError

    return 2**num - 1

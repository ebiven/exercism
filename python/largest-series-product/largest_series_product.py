import operator
from functools import reduce

def largest_product(digits, series_len):
    if series_len > len(digits):
        raise ValueError

    if series_len < 0:
        raise ValueError

    largest_sum = 0
    for i in range(len(digits) - series_len + 1):
        candidate_sum = reduce(operator.mul, map(int, digits[i:i+series_len]), 1)
        if candidate_sum > largest_sum:
            largest_sum = candidate_sum

    return largest_sum
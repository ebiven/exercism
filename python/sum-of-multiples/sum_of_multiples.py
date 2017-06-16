def sum_of_multiples(limit, multiples_of):
    def is_multiple_of(n):
        return any([n % i == 0 for i in multiples_of])

    return sum(filter(is_multiple_of, range(limit)))
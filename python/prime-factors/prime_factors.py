def prime_factors(target):
    factors = []
    current_divisor = 2
    while target > 1:
        while target % current_divisor == 0:
            factors.append(current_divisor)
            target //= current_divisor

        current_divisor += 1

    return factors
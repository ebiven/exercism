def square_of_sum(i):
    return sum(range(i+1))**2


def sum_of_squares(i):
    return sum(map(lambda x: x**2, range(i+1)))


def difference(i):
    return square_of_sum(i) - sum_of_squares(i)

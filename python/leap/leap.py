def is_leap_year(year):
    by_4 = year % 4 == 0
    by_100 = year % 100 == 0
    by_400 = year % 400 == 0
    return by_4 and (not by_100 or by_400)
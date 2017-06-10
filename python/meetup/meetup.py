from calendar import Calendar

def meetup_day(year, month, dow, schedule):
    possible_dates = [
            date for date in Calendar().itermonthdates(year, month)
            if date.month == month and date.strftime('%A') == dow
            ]

    if schedule == 'teenth':
        return filter(lambda d: 13 <= d.day <= 19, possible_dates)[0]

    if schedule == 'last':
        return possible_dates[-1]

    schedule = int(schedule[0]) - 1
    return possible_dates[schedule]

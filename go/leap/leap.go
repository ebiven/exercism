package leap

const testVersion = 3

func IsLeapYear(year int) bool {
	by4 := year%4 == 0
	by100 := year%100 == 0
	by400 := year%400 == 0

	return by4 && (!by100 || by400)
}

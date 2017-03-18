package accumulate

const testVersion = 1

func Accumulate(a []string, f func(item string) string) (result []string) {
	for _, i := range a {
		result = append(result, f(i))
	}
	return
}

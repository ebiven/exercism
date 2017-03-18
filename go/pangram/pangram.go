package pangram

import (
	"strings"
)

const testVersion = 1

var letters = []string{"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"}

func IsPangram(input string) bool {
	input = strings.ToLower(input)
	for _, l := range letters {
		if !strings.Contains(input, l) {
			return false
		}
	}

	return true
}

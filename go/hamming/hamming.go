package hamming

import (
	"errors"
)

const testVersion = 5

func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("inputs must be equal length")
	}

	distance := 0
	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			distance++
		}
	}

	return distance, nil
}

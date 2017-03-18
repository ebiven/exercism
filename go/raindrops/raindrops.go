package raindrops

import (
	"strconv"
)

const testVersion = 2

func Convert(i int) string {
	o := ""
	if i%3 == 0 {
		o += "Pling"
	}
	if i%5 == 0 {
		o += "Plang"
	}
	if i%7 == 0 {
		o += "Plong"
	}
	if len(o) == 0 {
		o = strconv.Itoa(i)
	}
	return o
}

package clock

import (
	"fmt"
)

const testVersion = 4

// Store our value in minutes.
type Clock int

func New(hour, minute int) Clock {
	// One hour is 60 minutes, plus the minutes, modulus to 1440 minutes in a
	// day.
	c := Clock((hour*60 + minute) % 1440)
	// Correct for when we wind up with negative values.
	if c < 0 {
		c += 1440
	}
	return c
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c/60, c%60)
}

func (c Clock) Add(minutes int) Clock {
	return New(0, int(c)+minutes)
}

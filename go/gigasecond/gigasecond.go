package gigasecond

import (
	"time"
)

const testVersion = 4

func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Second * 1e9)
}

package bob // package name must match the package name in bob_test.go

import (
	"regexp"
	"strings"
)

const testVersion = 2 // same as targetTestVersion

func Hey(i string) string {
	i = strings.TrimSpace(i)
	if isNothing(i) {
		return "Fine. Be that way!"
	}
	if isYelling(i) {
		return "Whoa, chill out!"
	}
	if isQuestion(i) {
		return "Sure."
	}
	return "Whatever."
}

func isNothing(i string) bool {
	return len(i) == 0
}

func isYelling(i string) bool {
	isAllUpper := strings.ToUpper(i) == i
	r := regexp.MustCompile("[A-z]")
	hasLetters := r.MatchString(i)

	return isAllUpper && hasLetters
}

func isQuestion(i string) bool {
	return strings.HasSuffix(i, "?")
}

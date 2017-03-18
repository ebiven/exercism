package acronym

import (
	"regexp"
	"strings"
)

const testVersion = 2

func Abbreviate(s string) string {
	re := regexp.MustCompile("[A-Z]+[a-z]*|[a-z]+")
	matches := re.FindAllString(s, -1)
	out := []string{}

	for _, match := range matches {
		out = append(out, strings.ToUpper(string(match[0])))
	}

	return strings.Join(out, "")
}

package triangle

import (
	"math"
	"sort"
)

const testVersion = 3

type Kind int

const (
	NaT Kind = iota // not a triangle
	Equ             // equilateral
	Iso             // isosceles
	Sca             // scalene
)

func KindFromSides(a, b, c float64) Kind {
	a, b, c = getSortedSides(a, b, c)

	if !isLegal(a, b, c) {
		return NaT
	}
	if a == c {
		return Equ
	}
	if a == b || b == c {
		return Iso
	}
	return Sca
}

func getSortedSides(a, b, c float64) (float64, float64, float64) {
	sides := []float64{a, b, c}
	sort.Float64s(sides)
	return sides[0], sides[1], sides[2]
}

func isLegal(a, b, c float64) bool {
	hasNaN := math.IsNaN(a) || math.IsNaN(b) || math.IsNaN(c)
	hasInf := math.IsInf(c, 0)
	tooShort := a <= 0
	cannotConnect := a+b < c
	return !(hasNaN || hasInf || tooShort || cannotConnect)
}

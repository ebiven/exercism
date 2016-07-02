module Leap exposing (..)

isLeapYear : Int -> Bool
isLeapYear year =
  by4 year && (notBy100 year || by400 year)

by4 : Int -> Bool
by4 year =
  year % 4 == 0

notBy100 : Int -> Bool
notBy100 year =
  year % 100 /= 0

by400 : Int -> Bool
by400 year =
  year % 400 == 0

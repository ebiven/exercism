module Bob exposing (..)

import String
import Regex

hey : String -> String
hey input =
  if isNothing input then
    "Fine. Be that way!"
  else if isYelling input then
    "Whoa, chill out!"
  else if isQuestion input then
    "Sure."
  else
    "Whatever."

isQuestion : String -> Bool
isQuestion input =
  String.endsWith "?" input

isNothing : String -> Bool
isNothing input =
  String.isEmpty (String.trim input)

isYelling : String -> Bool
isYelling input =
  input == String.toUpper input && Regex.contains hasCharactersRegex input

hasCharactersRegex : Regex.Regex
hasCharactersRegex =
  Regex.regex "[A-z]"

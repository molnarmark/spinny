# This very small and ugly program was used to translate
# https://github.com/sindresorhus/cli-spinners into Nim object definitions
import json, strutils, sequtils

let data = parseFile("spinners.json")

var kinds: seq[string]

for name, spinner in data.pairs:
  let name = capitalizeAscii(name)
  kinds.add name
  let interval = spinner["interval"].getInt()
  let frames = spinner["frames"].mapIt("      \"" & it.getStr().replace("\\", "\\\\") & "\",").join("\n")
  echo "  # $1\n  Spinner(\n    interval: $2, frames: @[\n$3\n    ]\n  )," % [name, $interval, frames]

echo "type SpinnerKind* = enum\n    " & kinds.join(", ")
# Package

version       = "0.1.2"
author        = "Mark Molnar"
description   = "Terminal Spinners for Nim."
license       = "MIT"

installFiles = @["spinny.nim", "spinny.nimble", "resources/spinners.json"]

# Dependencies
requires "nim >= 0.18.0", "colorize >= 0.2.0"

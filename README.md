# Spinny

Spinny is a tiny terminal spinner package for the Nim Programming Language.
![Spinny in Action](https://github.com/molnarmark/spinny/blob/master/action.gif)

## Getting Started

You can use Nimble to install the package by running:
```
nimble install spinny
```

Feel free to take the [example code](https://github.com/molnarmark/spinny/blob/master/spinny_example.nim) to test out the package!

## Usage

Spinny is quite easy to use. You can set an already running ```Spinny```'s symbol, color, or even the text!
```nim
import spinny, colorize, os

var spinner1 = newSpinny("Loading file..".fgWhite, "dots")
spinner1.setSymbolColor(colorize.fgBlue)
spinner1.start()

# do some work here
for x in countup(5, 10):
  sleep(500)

spinner1.success("File was loaded successfully.")

var spinner2 = newSpinny("Downloading files..".fgBlue, "dots5")
spinner2.setSymbolColor(colorize.fgLightBlue)
spinner2.start()

# do some work here
for x in countup(5, 10):
  sleep(500)

spinner1.error("Sorry, something went wrong during downloading!")
```

Spinny uses the [colorize](http://github.com/molnarmark/colorize) library for terminal colors.

## API Reference
The following procs are available on a ```Spinny``` object:
* setSymbolColor*(spinny: Spinny, color: proc(x: string): string)
* setSymbol*(spinny: Spinny, newSymbol: string)
* setText*(spinny: Spinny, newSymbol: string)
* start*(spinny: Spinny)
* stop*(spinny: Spinny)
* success*(spinny: Spinny, msg: string)
* error*(spinny: Spinny, msg: string)

## Contributing

All contributions are welcome. Feel free to make this project better. :)

## Authors

* Mark Molnar

## License

This project is licensed under the MIT License.
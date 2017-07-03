import spinny, colorize, os

var spinner = newSpinny("Loading my life..".fgWhite, "dots")
spinner.setSymbolColor(colorize.fgBlue)
spinner.start()

for x in countup(5, 10):
  sleep(500)
  # doing work

spinner.success("Everything was downloaded.")
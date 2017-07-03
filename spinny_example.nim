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
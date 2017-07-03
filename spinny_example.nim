import spinny, colorize, os

var sp = newSpinny("Loading something..".bold.fgRed, "dots")
sp.setColor(colorize.fgRed)
sp.start()

for x in countup(5, 10):
  sleep(500)
  # doing work

sp.stop()

var sp2 = newSpinny("Loading ffff..".bold.fgYellow, "dots5")
sp2.setColor(colorize.fgRed)
sp2.start()

for x in countup(5, 10):
  sleep(500)
  # doing work

sp2.stop()
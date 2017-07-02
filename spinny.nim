import locks, terminal, os, threadpool, asyncdispatch, colorize, json

type
  Spinny = ref SpinnyObj
  SpinnyObj = object
    t: Thread[Spinny]
    lock: Lock
    text: string
    running: bool

proc newSpinny*(text: string): Spinny =
  var spinners = readFile("spinners.json")
  var spinnersJson = parseJson(spinners)
  result = Spinny(text: text, running: true)


proc spinnyLoop(spinny: Spinny) {.thread.} =

  while spinny.running:
    acquire(spinny.lock)
    stdout.write("\r")
    stdout.write(spinny.text)
    stdout.flushFile()
    release(spinny.lock)
    sleep(80)
    eraseLine()


proc start*(spinny: Spinny) =
  initLock(spinny.lock)
  createThread(spinny.t, spinnyLoop, spinny)

proc stop(spinny: Spinny) =
  spinny.running = false
  joinThreads(spinny.t)
  echo ""
  setCursorXPos(0)

var sp = newSpinny("Loading something..".bold.fgRed)
sp.start()

for x in countup(5, 10):
  sleep(500)
  # doing work

sp.stop()
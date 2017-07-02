import locks, terminal, os, threadpool, asyncdispatch, colorize, json, sequtils

type
  Spinny = ref SpinnyObj
  SpinnyObj = object
    t: Thread[Spinny]
    lock: Lock
    text: string
    running: bool
    spinnerData: JsonNode

proc newSpinny*(text: string, spinner: string): Spinny =
  var spinners = readFile("spinners.json")
  var spinnersJson = parseJson($spinners)
  result = Spinny(text: text, running: true, spinnerData: spinnersJson[spinner])


proc spinnyLoop(spinny: Spinny) {.thread.} =
  var frameCounter = 0

  while spinny.running:
    var spinner = spinny.spinnerData["frames"][frameCounter].getStr()
    acquire(spinny.lock)
    stdout.write("\r")
    stdout.write(spinner & " " & spinny.text)
    stdout.flushFile()
    release(spinny.lock)
    sleep(80)
    eraseLine()

    if frameCounter >= spinny.spinnerData["frames"].len - 1: frameCounter = 0 else: frameCounter += 1

proc start*(spinny: Spinny) =
  initLock(spinny.lock)
  createThread(spinny.t, spinnyLoop, spinny)

proc stop(spinny: Spinny) =
  spinny.running = false
  joinThreads(spinny.t)
  echo ""
  setCursorXPos(0)

var sp = newSpinny("Loading something..".bold.fgRed, "dots2")
sp.start()

for x in countup(5, 10):
  sleep(500)
  # doing work

sp.stop()
import locks, os, threadpool, asyncdispatch, colorize, json, sequtils

type
  Spinny = ref SpinnyObj
  SpinnyObj = object
    t: Thread[Spinny]
    lock: Lock
    text: string
    running: bool
    frames: seq[JsonNode]
    frame: string

proc newSpinny*(text: string, spinner: string): Spinny =
  var spinners = readFile("spinners.json")
  var frames = parseJson($spinners)[spinner]["frames"].getElems()
  result = Spinny(text: text, running: true, frames: frames)

proc spinnyLoop(spinny: Spinny) {.thread.} =
  var frameCounter = 0

  while spinny.running:
    spinny.frame = spinny.frames[frameCounter].getStr()
    acquire(spinny.lock)
    stdout.write("\r")
    stdout.write("a" & " " & spinny.text)
    stdout.flushFile()
    release(spinny.lock)
    sleep(80)

    if frameCounter >= spinny.frames.len - 1:
      frameCounter = 0
    else: frameCounter += 1

proc start*(spinny: Spinny) =
  initLock(spinny.lock)
  createThread(spinny.t, spinnyLoop, spinny)

proc stop(spinny: Spinny) =
  spinny.running = false
  joinThreads(spinny.t)
  echo ""

proc setColor(spinny: Spinny, color: proc(x: string): string) =
  spinny.frames = map(spinny.frames, proc(node: JsonNode): JsonNode = newJString(node.getStr().color()))


var sp = newSpinny("Loading something..".bold.fgRed, "bouncingBall")
sp.setColor(colorize.fgRed)
sp.start()

for x in countup(5, 10):
  sleep(500)
  # doing work

sp.stop()
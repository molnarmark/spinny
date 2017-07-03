import locks, os, threadpool, asyncdispatch, colorize, json, sequtils, terminal

type
  Spinny = ref SpinnyObj
  SpinnyObj = object
    t: Thread[Spinny]
    lock: Lock
    text: string
    running: bool
    frames: seq[JsonNode]
    frame: string

  SpinnyEvent = object
    name: string
    payload: string

var c: Channel[SpinnyEvent]

proc newSpinny*(text: string, spinner: string): Spinny =
  var spinners = readFile("spinners.json")
  var frames = parseJson($spinners)[spinner]["frames"].getElems()
  result = Spinny(text: text, running: true, frames: frames)

proc setColor*(spinny: Spinny, color: proc(x: string): string) =
  spinny.frames = map(spinny.frames, proc(node: JsonNode): JsonNode = newJString(node.getStr().color()))

proc handleEvent(spinny: Spinny, eventData: SpinnyEvent): bool =
  if eventData.name == "stop": return false

proc spinnyLoop(spinny: Spinny) {.thread.} =
  var frameCounter = 0

  while spinny.running:
    var data = c.tryRecv()
    if data.dataAvailable:
      if not spinny.handleEvent(data.msg):
        break

    stdout.flushFile()
    spinny.frame = spinny.frames[frameCounter].getStr()
    acquire(spinny.lock)
    eraseLine()
    stdout.write(spinny.frame & " " & spinny.text)
    stdout.flushFile()
    release(spinny.lock)
    sleep(80)

    if frameCounter >= spinny.frames.len - 1:
      frameCounter = 0
    else:
      frameCounter += 1

proc start*(spinny: Spinny) =
  initLock(spinny.lock)
  c.open()
  createThread(spinny.t, spinnyLoop, spinny)

proc stop*(spinny: Spinny) =
  spinny.running = false
  c.send(SpinnyEvent(name: "stop", payload: ""))
  joinThread(spinny.t)
  echo ""
  # c.close()
  sync()
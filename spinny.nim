import colorize, json
from terminal import eraseLine
from sequtils import map
from os import sleep
from locks import initLock, Lock, acquire, release
from threadpool import sync

type
  Spinny = ref SpinnyObj
  SpinnyObj = object
    t: Thread[Spinny]
    lock: Lock
    text: string
    running: bool
    frames: seq[JsonNode]
    frame: string
    customSymbol: bool

  SpinnyEvent = object
    name: string
    payload: string

var spinnyChannel: Channel[SpinnyEvent]

const spinners_json = staticRead("spinners.json")
# let spinners_json = readFile("spinners.json")

var spinners_parsed = parseJson($spinners_json)

proc newSpinny*(text: string, spinner: string): Spinny =
  var frames = spinners_parsed[spinner]["frames"].getElems()
  Spinny(text: text, running: true, frames: frames, customSymbol: false)

proc newSpinny*(text: string, frames: seq[JsonNode]): Spinny =
  Spinny(text: text, running: true, frames: frames, customSymbol: false)

proc setSymbolColor*(spinny: Spinny, color: proc(x: string): string) =
  spinny.frames = map(spinny.frames, proc(node: JsonNode): JsonNode = newJString(node.getStr().color()))

proc setSymbol*(spinny: Spinny, newSymbol: string) =
  spinnyChannel.send(SpinnyEvent(name: "symbol_change", payload: newSymbol))

proc setText*(spinny: Spinny, newSymbol: string) =
  spinnyChannel.send(SpinnyEvent(name: "text_change", payload: newSymbol))

proc handleEvent(spinny: Spinny, eventData: SpinnyEvent): bool =
  case eventData.name:
  of "stop":
    return false

  of "symbol_change":
    spinny.customSymbol = true
    spinny.frame = eventData.payload
    return true

  of "text_change":
    spinny.text = eventData.payload
    return true

  of "stop_success":
    spinny.customSymbol = true
    spinny.frame = "✔".bold.fgGreen
    spinny.text = eventData.payload.bold.fgGreen
    return true

  of "stop_error":
    spinny.customSymbol = true
    spinny.frame = "✖".bold.fgRed
    spinny.text = eventData.payload.bold.fgRed
    return true

proc spinnyLoop(spinny: Spinny) {.thread.} =
  var frameCounter = 0

  while spinny.running:
    var data = spinnyChannel.tryRecv()
    if data.dataAvailable:
      if not spinny.handleEvent(data.msg):
        break

    stdout.flushFile()
    if not spinny.customSymbol: spinny.frame = spinny.frames[frameCounter].getStr()
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
  spinnyChannel.open()
  createThread(spinny.t, spinnyLoop, spinny)

proc stop*(spinny: Spinny) =
  spinny.running = false
  spinnyChannel.send(SpinnyEvent(name: "stop", payload: ""))
  joinThread(spinny.t)
  echo ""
  # spinnyChannel.close()
  sync()

proc success*(spinny: Spinny, msg: string) =
  spinnyChannel.send(SpinnyEvent(name: "stop_success", payload: msg))
  spinny.stop()

proc error*(spinny: Spinny, msg: string) =
  spinnyChannel.send(SpinnyEvent(name: "stop_error", payload: msg))
  spinny.stop()


when isMainModule:
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

  spinner2.error("Sorry, something went wrong during downloading!")

  var spinner3 = newSpinny("lolz, i is custom", @[%* "x", %* "y"])
  spinner3.setSymbolColor(colorize.fgGreen)

  spinner3.start()

  # do some magnificent work here
  for x in countup(1, 5):
    sleep(500)

  spinner3.success("Fancy my pants! It's working.")

import os, terminal, locks
import sequtils

import spinny/[colorize, spinners]

export colorize
export SpinnerKind, Spinner, makeSpinner

type
  Spinny = ref object
    t: Thread[Spinny]
    lock: Lock
    text: string
    running: bool
    frames: seq[string]
    frame: string
    interval: int
    customSymbol: bool

  EventKind = enum
    Stop, StopSuccess, StopError,
    SymbolChange, TextChange,

  SpinnyEvent = object
    kind: EventKind
    payload: string

var spinnyChannel: Channel[SpinnyEvent]

proc newSpinny*(text: string, s: Spinner): Spinny =
  Spinny(
    text: text,
    running: true,
    frames: s.frames,
    customSymbol: false,
    interval: s.interval
  )

proc newSpinny*(text: string, spinType: SpinnerKind): Spinny =
  newSpinny(text, Spinners[spinType])

proc setSymbolColor*(spinny: Spinny, color: proc(x: string): string) =
  spinny.frames = mapIt(spinny.frames, color(it))

proc setSymbol*(spinny: Spinny, symbol: string) =
  spinnyChannel.send(SpinnyEvent(kind: SymbolChange, payload: symbol))

proc setText*(spinny: Spinny, text: string) =
  spinnyChannel.send(SpinnyEvent(kind: TextChange, payload: text))

proc handleEvent(spinny: Spinny, eventData: SpinnyEvent): bool =
  result = true
  case eventData.kind
  of Stop:
    result = false
  of SymbolChange:
    spinny.customSymbol = true
    spinny.frame = eventData.payload
  of TextChange:
    spinny.text = eventData.payload
  of StopSuccess:
    spinny.customSymbol = true
    spinny.frame = "✔".bold.fgGreen
    spinny.text = eventData.payload.bold.fgGreen
  of StopError:
    spinny.customSymbol = true
    spinny.frame = "✖".bold.fgRed
    spinny.text = eventData.payload.bold.fgRed

proc spinnyLoop(spinny: Spinny) {.thread.} =
  var frameCounter = 0

  while spinny.running:
    let data = spinnyChannel.tryRecv()
    if data.dataAvailable:
      # If we received a Stop event
      if not spinny.handleEvent(data.msg):
        spinnyChannel.close()
        # This is required so we can reopen the same channel more than once
        # See https://github.com/nim-lang/Nim/issues/6369
        spinnyChannel = default(typeof(spinnyChannel))
        # TODO: Do we need spinny.running at all?
        spinny.running = false
        break

    stdout.flushFile()
    if not spinny.customSymbol:
      spinny.frame = spinny.frames[frameCounter]

    withLock spinny.lock:
      eraseLine()
      stdout.write(spinny.frame & " " & spinny.text)
      stdout.flushFile()

    sleep(spinny.interval)

    if frameCounter >= spinny.frames.len - 1:
      frameCounter = 0
    else:
      frameCounter += 1

proc start*(spinny: Spinny) =
  initLock(spinny.lock)
  spinnyChannel.open()
  createThread(spinny.t, spinnyLoop, spinny)

proc stop(spinny: Spinny, kind: EventKind, payload = "") =
  spinnyChannel.send(SpinnyEvent(kind: kind, payload: payload))
  spinnyChannel.send(SpinnyEvent(kind: Stop))
  joinThread(spinny.t)
  echo ""

proc stop*(spinny: Spinny) =
  spinny.stop(Stop)

proc success*(spinny: Spinny, msg: string) =
  spinny.stop(StopSuccess, msg)

proc error*(spinny: Spinny, msg: string) =
  spinny.stop(StopError, msg)

type
  SpinnerKind* = enum
    Dots, Dots2, Dots3, Dots4, Dots5, Dots6, Dots7, Dots8, Dots9,
    Dots10, Dots11, Dots12, Line, Line​‌​2, Pipe, SimpleDots,
    SimpleDotsScrolling, Star, Star2, Flip, Hamburger, GrowVertical,
    GrowHorizontal​‌​, Balloon, Balloon2, Noise, Bounce, BoxBounce, BoxBounce2,
    Triangle, Arc, Circle, SquareCorners, Cir​‌​cleQuarters, CircleHalves, Squish,
    Toggle, Toggle2, Toggle3, Toggle4, Toggle5, Toggle6, Toggle7, Tog​‌​gle8,
    Toggle9, Toggle10, Toggle11, Toggle12, Toggle13, Arrow, Arrow2, Arrow3,
    BouncingBar, BouncingB​‌​all, Smiley, Monkey, Hearts,
    Clock, Earth, Moon, Runner, Pong, Shark, Dqpb
  Spinner* = object
    interval*: int
    frames*: seq[string]

const Spinners*: array[SpinnerKind, Spinner] = [
  # Dots
  Spinner(
    interval: 80, frames: @[
      "⠋",
      "⠙",
      "⠹",
      "⠸",
      "⠼",
      "⠴",
      "⠦",
      "⠧",
      "⠇",
      "⠏",
    ]
  ),
  # Dots2
  Spinner(
    interval: 80, frames: @[
      "⣾",
      "⣽",
      "⣻",
      "⢿",
      "⡿",
      "⣟",
      "⣯",
      "⣷",
    ]
  ),
  # Dots3
  Spinner(
    interval: 80, frames: @[
      "⠋",
      "⠙",
      "⠚",
      "⠞",
      "⠖",
      "⠦",
      "⠴",
      "⠲",
      "⠳",
      "⠓",
    ]
  ),
  # Dots4
  Spinner(
    interval: 80, frames: @[
      "⠄",
      "⠆",
      "⠇",
      "⠋",
      "⠙",
      "⠸",
      "⠰",
      "⠠",
      "⠰",
      "⠸",
      "⠙",
      "⠋",
      "⠇",
      "⠆",
    ]
  ),
  # Dots5
  Spinner(
    interval: 80, frames: @[
      "⠋",
      "⠙",
      "⠚",
      "⠒",
      "⠂",
      "⠂",
      "⠒",
      "⠲",
      "⠴",
      "⠦",
      "⠖",
      "⠒",
      "⠐",
      "⠐",
      "⠒",
      "⠓",
      "⠋",
    ]
  ),
  # Dots6
  Spinner(
    interval: 80, frames: @[
      "⠁",
      "⠉",
      "⠙",
      "⠚",
      "⠒",
      "⠂",
      "⠂",
      "⠒",
      "⠲",
      "⠴",
      "⠤",
      "⠄",
      "⠄",
      "⠤",
      "⠴",
      "⠲",
      "⠒",
      "⠂",
      "⠂",
      "⠒",
      "⠚",
      "⠙",
      "⠉",
      "⠁",
    ]
  ),
  # Dots7
  Spinner(
    interval: 80, frames: @[
      "⠈",
      "⠉",
      "⠋",
      "⠓",
      "⠒",
      "⠐",
      "⠐",
      "⠒",
      "⠖",
      "⠦",
      "⠤",
      "⠠",
      "⠠",
      "⠤",
      "⠦",
      "⠖",
      "⠒",
      "⠐",
      "⠐",
      "⠒",
      "⠓",
      "⠋",
      "⠉",
      "⠈",
    ]
  ),
  # Dots8
  Spinner(
    interval: 80, frames: @[
      "⠁",
      "⠁",
      "⠉",
      "⠙",
      "⠚",
      "⠒",
      "⠂",
      "⠂",
      "⠒",
      "⠲",
      "⠴",
      "⠤",
      "⠄",
      "⠄",
      "⠤",
      "⠠",
      "⠠",
      "⠤",
      "⠦",
      "⠖",
      "⠒",
      "⠐",
      "⠐",
      "⠒",
      "⠓",
      "⠋",
      "⠉",
      "⠈",
      "⠈",
    ]
  ),
  # Dots9
  Spinner(
    interval: 80, frames: @[
      "⢹",
      "⢺",
      "⢼",
      "⣸",
      "⣇",
      "⡧",
      "⡗",
      "⡏",
    ]
  ),
  # Dots10
  Spinner(
    interval: 80, frames: @[
      "⢄",
      "⢂",
      "⢁",
      "⡁",
      "⡈",
      "⡐",
      "⡠",
    ]
  ),
  # Dots11
  Spinner(
    interval: 100, frames: @[
      "⠁",
      "⠂",
      "⠄",
      "⡀",
      "⢀",
      "⠠",
      "⠐",
      "⠈",
    ]
  ),
  # Dots12
  Spinner(
    interval: 80, frames: @[
      "⢀⠀",
      "⡀⠀",
      "⠄⠀",
      "⢂⠀",
      "⡂⠀",
      "⠅⠀",
      "⢃⠀",
      "⡃⠀",
      "⠍⠀",
      "⢋⠀",
      "⡋⠀",
      "⠍⠁",
      "⢋⠁",
      "⡋⠁",
      "⠍⠉",
      "⠋⠉",
      "⠋⠉",
      "⠉⠙",
      "⠉⠙",
      "⠉⠩",
      "⠈⢙",
      "⠈⡙",
      "⢈⠩",
      "⡀⢙",
      "⠄⡙",
      "⢂⠩",
      "⡂⢘",
      "⠅⡘",
      "⢃⠨",
      "⡃⢐",
      "⠍⡐",
      "⢋⠠",
      "⡋⢀",
      "⠍⡁",
      "⢋⠁",
      "⡋⠁",
      "⠍⠉",
      "⠋⠉",
      "⠋⠉",
      "⠉⠙",
      "⠉⠙",
      "⠉⠩",
      "⠈⢙",
      "⠈⡙",
      "⠈⠩",
      "⠀⢙",
      "⠀⡙",
      "⠀⠩",
      "⠀⢘",
      "⠀⡘",
      "⠀⠨",
      "⠀⢐",
      "⠀⡐",
      "⠀⠠",
      "⠀⢀",
      "⠀⡀",
    ]
  ),
  # Line
  Spinner(
    interval: 130, frames: @[
      "-",
      "\\",
      "|",
      "/",
    ]
  ),
  # Line2
  Spinner(
    interval: 100, frames: @[
      "⠂",
      "-",
      "–",
      "—",
      "–",
      "-",
    ]
  ),
  # Pipe
  Spinner(
    interval: 100, frames: @[
      "┤",
      "┘",
      "┴",
      "└",
      "├",
      "┌",
      "┬",
      "┐",
    ]
  ),
  # SimpleDots
  Spinner(
    interval: 400, frames: @[
      ". ",
      "..",
      "...",
      "  ",
    ]
  ),
  # SimpleDotsScrolling
  Spinner(
    interval: 200, frames: @[
      ". ",
      "..",
      "...",
      " ..",
      "  .",
      "  ",
    ]
  ),
  # Star
  Spinner(
    interval: 70, frames: @[
      "✶",
      "✸",
      "✹",
      "✺",
      "✹",
      "✷",
    ]
  ),
  # Star2
  Spinner(
    interval: 80, frames: @[
      "+",
      "x",
      "*",
    ]
  ),
  # Flip
  Spinner(
    interval: 70, frames: @[
      "_",
      "_",
      "_",
      "-",
      "`",
      "`",
      "'",
      "´",
      "-",
      "_",
      "_",
      "_",
    ]
  ),
  # Hamburger
  Spinner(
    interval: 100, frames: @[
      "☱",
      "☲",
      "☴",
    ]
  ),
  # GrowVertical
  Spinner(
    interval: 120, frames: @[
      "▁",
      "▃",
      "▄",
      "▅",
      "▆",
      "▇",
      "▆",
      "▅",
      "▄",
      "▃",
    ]
  ),
  # GrowHorizontal
  Spinner(
    interval: 120, frames: @[
      "▏",
      "▎",
      "▍",
      "▌",
      "▋",
      "▊",
      "▉",
      "▊",
      "▋",
      "▌",
      "▍",
      "▎",
    ]
  ),
  # Balloon
  Spinner(
    interval: 140, frames: @[
      "",
      ".",
      "o",
      "O",
      "@",
      "*",
      "",
    ]
  ),
  # Balloon2
  Spinner(
    interval: 120, frames: @[
      ".",
      "o",
      "O",
      "°",
      "O",
      "o",
      ".",
    ]
  ),
  # Noise
  Spinner(
    interval: 100, frames: @[
      "▓",
      "▒",
      "░",
    ]
  ),
  # Bounce
  Spinner(
    interval: 120, frames: @[
      "⠁",
      "⠂",
      "⠄",
      "⠂",
    ]
  ),
  # BoxBounce
  Spinner(
    interval: 120, frames: @[
      "▖",
      "▘",
      "▝",
      "▗",
    ]
  ),
  # BoxBounce2
  Spinner(
    interval: 100, frames: @[
      "▌",
      "▀",
      "▐",
      "▄",
    ]
  ),
  # Triangle
  Spinner(
    interval: 50, frames: @[
      "◢",
      "◣",
      "◤",
      "◥",
    ]
  ),
  # Arc
  Spinner(
    interval: 100, frames: @[
      "◜",
      "◠",
      "◝",
      "◞",
      "◡",
      "◟",
    ]
  ),
  # Circle
  Spinner(
    interval: 120, frames: @[
      "◡",
      "⊙",
      "◠",
    ]
  ),
  # SquareCorners
  Spinner(
    interval: 180, frames: @[
      "◰",
      "◳",
      "◲",
      "◱",
    ]
  ),
  # CircleQuarters
  Spinner(
    interval: 120, frames: @[
      "◴",
      "◷",
      "◶",
      "◵",
    ]
  ),
  # CircleHalves
  Spinner(
    interval: 50, frames: @[
      "◐",
      "◓",
      "◑",
      "◒",
    ]
  ),
  # Squish
  Spinner(
    interval: 100, frames: @[
      "╫",
      "╪",
    ]
  ),
  # Toggle
  Spinner(
    interval: 250, frames: @[
      "⊶",
      "⊷",
    ]
  ),
  # Toggle2
  Spinner(
    interval: 80, frames: @[
      "▫",
      "▪",
    ]
  ),
  # Toggle3
  Spinner(
    interval: 120, frames: @[
      "□",
      "■",
    ]
  ),
  # Toggle4
  Spinner(
    interval: 100, frames: @[
      "■",
      "□",
      "▪",
      "▫",
    ]
  ),
  # Toggle5
  Spinner(
    interval: 100, frames: @[
      "▮",
      "▯",
    ]
  ),
  # Toggle6
  Spinner(
    interval: 300, frames: @[
      "ဝ",
      "၀",
    ]
  ),
  # Toggle7
  Spinner(
    interval: 80, frames: @[
      "⦾",
      "⦿",
    ]
  ),
  # Toggle8
  Spinner(
    interval: 100, frames: @[
      "◍",
      "◌",
    ]
  ),
  # Toggle9
  Spinner(
    interval: 100, frames: @[
      "◉",
      "◎",
    ]
  ),
  # Toggle10
  Spinner(
    interval: 100, frames: @[
      "㊂",
      "㊀",
      "㊁",
    ]
  ),
  # Toggle11
  Spinner(
    interval: 50, frames: @[
      "⧇",
      "⧆",
    ]
  ),
  # Toggle12
  Spinner(
    interval: 120, frames: @[
      "☗",
      "☖",
    ]
  ),
  # Toggle13
  Spinner(
    interval: 80, frames: @[
      "=",
      "*",
      "-",
    ]
  ),
  # Arrow
  Spinner(
    interval: 100, frames: @[
      "←",
      "↖",
      "↑",
      "↗",
      "→",
      "↘",
      "↓",
      "↙",
    ]
  ),
  # Arrow2
  Spinner(
    interval: 80, frames: @[
      "⬆",
      "↗",
      "➡",
      "↘",
      "⬇",
      "↙",
      "⬅",
      "↖",
    ]
  ),
  # Arrow3
  Spinner(
    interval: 120, frames: @[
      "▹▹▹▹▹",
      "▸▹▹▹▹",
      "▹▸▹▹▹",
      "▹▹▸▹▹",
      "▹▹▹▸▹",
      "▹▹▹▹▸",
    ]
  ),
  # BouncingBar
  Spinner(
    interval: 80, frames: @[
      "[    ]",
      "[   =]",
      "[  ==]",
      "[ ===]",
      "[====]",
      "[=== ]",
      "[==  ]",
      "[=   ]",
    ]
  ),
  # BouncingBall
  Spinner(
    interval: 80, frames: @[
      "( ●    )",
      "(  ●   )",
      "(   ●  )",
      "(    ● )",
      "(     ●)",
      "(    ● )",
      "(   ●  )",
      "(  ●   )",
      "( ●    )",
      "(●     )",
    ]
  ),
  # Smiley
  Spinner(
    interval: 200, frames: @[
      "😄",
      "😝",
    ]
  ),
  # Monkey
  Spinner(
    interval: 300, frames: @[
      "🙈",
      "🙈",
      "🙉",
      "🙊",
    ]
  ),
  # Hearts
  Spinner(
    interval: 100, frames: @[
      "💛",
      "💙",
      "💜",
      "💚",
      "❤",
    ]
  ),
  # Clock
  Spinner(
    interval: 100, frames: @[
      "🕐",
      "🕑",
      "🕒",
      "🕓",
      "🕔",
      "🕕",
      "🕖",
      "🕗",
      "🕘",
      "🕙",
      "🕚",
    ]
  ),
  # Earth
  Spinner(
    interval: 180, frames: @[
      "🌍",
      "🌎",
      "🌏",
    ]
  ),
  # Moon
  Spinner(
    interval: 80, frames: @[
      "🌑",
      "🌒",
      "🌓",
      "🌔",
      "🌕",
      "🌖",
      "🌗",
      "🌘",
    ]
  ),
  # Runner
  Spinner(
    interval: 140, frames: @[
      "🚶",
      "🏃",
    ]
  ),
  # Pong
  Spinner(
    interval: 80, frames: @[
      "▐⠂       ▌",
      "▐⠈       ▌",
      "▐ ⠂      ▌",
      "▐ ⠠      ▌",
      "▐  ⡀     ▌",
      "▐  ⠠     ▌",
      "▐   ⠂    ▌",
      "▐   ⠈    ▌",
      "▐    ⠂   ▌",
      "▐    ⠠   ▌",
      "▐     ⡀  ▌",
      "▐     ⠠  ▌",
      "▐      ⠂ ▌",
      "▐      ⠈ ▌",
      "▐       ⠂▌",
      "▐       ⠠▌",
      "▐       ⡀▌",
      "▐      ⠠ ▌",
      "▐      ⠂ ▌",
      "▐     ⠈  ▌",
      "▐     ⠂  ▌",
      "▐    ⠠   ▌",
      "▐    ⡀   ▌",
      "▐   ⠠    ▌",
      "▐   ⠂    ▌",
      "▐  ⠈     ▌",
      "▐  ⠂     ▌",
      "▐ ⠠      ▌",
      "▐ ⡀      ▌",
      "▐⠠       ▌",
    ]
  ),
  # Shark
  Spinner(
    interval: 120, frames: @[
      "▐|\\____________▌",
      "▐_|\\___________▌",
      "▐__|\\__________▌",
      "▐___|\\_________▌",
      "▐____|\\________▌",
      "▐_____|\\_______▌",
      "▐______|\\______▌",
      "▐_______|\\_____▌",
      "▐________|\\____▌",
      "▐_________|\\___▌",
      "▐__________|\\__▌",
      "▐___________|\\_▌",
      "▐____________|\\▌",
      "▐____________/|▌",
      "▐___________/|_▌",
      "▐__________/|__▌",
      "▐_________/|___▌",
      "▐________/|____▌",
      "▐_______/|_____▌",
      "▐______/|______▌",
      "▐_____/|_______▌",
      "▐____/|________▌",
      "▐___/|_________▌",
      "▐__/|__________▌",
      "▐_/|___________▌",
      "▐/|____________▌",
    ]
  ),
  # Dqpb
  Spinner(
    interval: 100, frames: @[
      "d",
      "q",
      "p",
      "b",
    ]
  ),
]
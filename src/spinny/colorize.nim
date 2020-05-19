# https://github.com/molnarmark/colorize
proc reset(): string = "\e[0m"

# foreground colors
proc fgRed*(s: string): string = "\e[31m" & s & reset()
proc fgBlack*(s: string): string = "\e[30m" & s & reset()
proc fgGreen*(s: string): string= "\e[32m" & s & reset()
proc fgYellow*(s: string): string= "\e[33m" & s & reset()
proc fgBlue*(s: string): string= "\e[34m" & s & reset()
proc fgMagenta*(s: string): string= "\e[35m" & s & reset()
proc fgCyan*(s: string): string= "\e[36m" & s & reset()
proc fgLightGray*(s: string): string= "\e[37m" & s & reset()
proc fgDarkGray*(s: string): string= "\e[90m" & s & reset()
proc fgLightRed*(s: string): string= "\e[91m" & s & reset()
proc fgLightGreen*(s: string): string= "\e[92m" & s & reset()
proc fgLightYellow*(s: string): string= "\e[93m" & s & reset()
proc fgLightBlue*(s: string): string= "\e[94m" & s & reset()
proc fgLightMagenta*(s: string): string= "\e[95m" & s & reset()
proc fgLightCyan*(s: string): string= "\e[96m" & s & reset()
proc fgWhite*(s: string): string= "\e[97m" & s & reset()

# background colors
proc bgBlack*(s: string): string= "\e[40m" & s & reset()
proc bgRed*(s: string): string= "\e[41m" & s & reset()
proc bgGreen*(s: string): string= "\e[42m" & s & reset()
proc bgYellow*(s: string): string= "\e[43m" & s & reset()
proc bgBlue*(s: string): string= "\e[44m" & s & reset()
proc bgMagenta*(s: string): string= "\e[45m" & s & reset()
proc bgCyan*(s: string): string= "\e[46m" & s & reset()
proc bgLightGray*(s: string): string= "\e[47m" & s & reset()
proc bgDarkGray*(s: string): string= "\e[100m" & s & reset()
proc bgLightRed*(s: string): string= "\e[101m" & s & reset()
proc bgLightGreen*(s: string): string= "\e[102m" & s & reset()
proc bgLightYellow*(s: string): string= "\e[103m" & s & reset()
proc bgLightBlue*(s: string): string= "\e[104m" & s & reset()
proc bgLightMagenta*(s: string): string= "\e[105m" & s & reset()
proc bgLightCyan*(s: string): string= "\e[106m" & s & reset()
proc bgWhite*(s: string): string= "\e[107m" & s & reset()

# formatting functions
proc bold*(s: string): string= "\e[1m" & s & reset()
proc underline*(s: string): string= "\e[4m" & s & reset()
proc hidden*(s: string): string= "\e[8m" & s & reset()
proc invert*(s: string): string= "\e[7m" & s & reset()
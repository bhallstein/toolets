colorize() {  # takes string to colorize
  X=$(echo "$1" | lolcat -f -F 1.2 -S 7)

  # strip reset commands
  X=$(echo "$X" | sed $'s/\033\[0m//g')

  # escape characters -> \[\033[38;5;39m\] (for PS1)
  X=$(echo "$X" | sed -r $'s/\033''(\[[0-9]+;[0-9]+;[0-9]+m)/\\\[\\033\1\\\]/g')

  echo $X
}


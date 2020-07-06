#!/bin/zsh
PROGRAM_NAME=$(basename $0)

function help_message {
  echo "$PROGRAM_NAME: <sleep_time> <message>"
}

# Confirm right number of arguments
if [ $# -ne 2 ]; then
  help_message
fi

# Don't set off the timer unless the timer input
# is valid.
if $(sleep $1); then
  # Set off the timer message, ten times.
  for i in $(seq 0 10); do
    echo $2 | nohup espeak &> /dev/null
  done
fi

# alias tea_timer='sleep 3m; while true; do echo "Tea time" | espeak; done'

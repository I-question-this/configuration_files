#!/usr/bin/env bash
#
# Pomodero timer
#
# Exit values:
# 0 on success
# 1 on failure
#

# Name of the script
SCRIPT=$( basename "$0" )

# Current version
VERSION="1.0.0"

#
# Message to display for usage and help.
#
WORK=25
SHORT=5
LONG=15
function usage {
  local txt=(
"Utility $SCRIPT for doing stuff."
"Usage: $SCRIPT [options] <command> [arguments]"
""
"Command:"
"  work            Turn off notifications and work for $WORK minutes"
"  short-break     Take a break for $SHORT minutes"
"  long-break      Take a break for $LONG minutes"
""
"Options:"
"  --help, -h     Print help."
"  --version, -v  Print version."
   )

   printf "%s\n" "${txt[@]}"
}

#
# Message to display when bad usage.
#
function badUsage {
  local message="$1"
  local txt=(
"For an overview of the command, execute:"
"$SCRIPT --help"
  )

  [[ $message ]] && printf "$message\n"

  printf "%s\n" "${txt[@]}"
}

#
# Message to display for version.
#
function version {
  local txt=(
"$SCRIPT version $VERSION"
  )

  printf "%s\n" "${txt[@]}"
}

function app-work {
  # Ensure notifications are on
  dunstctl set-paused false && dunst_status.sh
  # Notify beginning of work session
  notify-send "Pomodero: WORK START" "Work for $WORK minutes."
  # Wait 10 seconds before turning off notifications
  sleep 10s
  # Turn off notifications
  dunstctl set-paused true && dunst_status.sh
  # Sleep for WORK minutes
  sleep ${WORK}m
  # Turn on notifications
  dunstctl set-paused false && dunst_status.sh
  # Notify end of work session
  notify-send "Pomodero: WORK END" "Work is done, good job."
}

function break-command {
  local break_type="$1"
  local break_length="$2"

  # Ensure notifications are on
  dunstctl set-paused false && dunst_status.sh
  # Notify beginning of break session
  notify-send "Pomodero: $break_type BREAK START"\
    "Break for $break_length minutes."
  sleep ${break_length}m
  # Notify end of break session
  notify-send "Pomodero: $break_type BREAK END"\
    "End of break."
}

function app-short-break {
  break-command SHORT $SHORT
}

function app-long-break {
  break-command LONG $LONG
}

#
# Process options
#
while (( $# )); do
  case "$1" in
    --help | -h)
      usage
      exit 0
    ;;

    --version | -v)
      version
      exit 0
    ;;

    work \
    | short-break \
    | long-break)
      command=$1
      shift
      app-$command $*
      exit 0
    ;;

    *)
      badUsage "Option/command not recognized."
      exit 1
    ;;
  esac
done

badUsage
exit 1

#!/bin/bash

logsDir=$HOME/.cache/unisonLogs
rm -rf $logsDir
mkdir -p $logsDir

process1Name=""
process1Id=-1
process2Name=""
process2Id=-1
completedJobs=""

function run_unison ()
{
	unison -auto -batch $1 >> "$logsDir/$1.log" 2>&1 &
  echo $!
}

function wait_message ()
{
  notify-send "Unison Backup Status" "Waiting: $process1Name, and $process2Name\nCompleted:$completedJobs"
}

function add_to_completed_jobs ()
{
  if [ -n "$completedJobs" ]; then
    completedJobs="$completedJobs, $1"
  else
    completedJobs=$1
  fi
}

for preference_file in $(ls $HOME/.unison | grep prf); do
  # Get the name of the unison job
	filtered_preference_file=$(echo $preference_file | sed 's/.prf//g')
  # Check if process 1 has never been created
  if [ $process1Id -eq -1 ]; then
    process1Id=$(run_unison $filtered_preference_file)
    process1Name=$filtered_preference_file
  # Check if process 2 has never been created
  elif [ $process2Id -eq -1 ]; then
    process2Id=$(run_unison $filtered_preference_file)
    process2Name=$filtered_preference_file
    # Two processes have been started so inform the user
    wait_message
  else
    while true; do
      # Check if processes are running
      process1Running=$(ps | grep $process1Id | wc -l)
      process2Running=$(ps | grep $process2Id | wc -l)
      # Check if process 1 is not running:w

      if [ $process1Running -eq 0 ]; then
        add_to_completed_jobs $process1Name
        process1Id=$(run_unison $filtered_preference_file)
        process1Name=$filtered_preference_file
        # A new process has been started, so inform the user
        wait_message
        break
      # check if process 2 is not running
      elif [ $process2Running -eq 0 ]; then
        add_to_completed_jobs $process2Name
        process2Id=$(run_unison $filtered_preference_file)
        process2Name=$filtered_preference_file
        # A new process has been started, so inform the user
        wait_message
        break
      # Both are running so continue sleeping
      else
        sleep 1
        echo "Test prints: $(date)"
        echo "$process1Id -- $process1Name -- $process1Running"
        echo "$process2Id -- $process2Name -- $process2Running"
      fi
    done
  fi
done

# Wait for all remaining jobs
wait $process1Id
wait $process2Id
# Notify the user of this scripts completion
notify-send "Unison Backup Complete" "Logs are located in ${logsDir}"


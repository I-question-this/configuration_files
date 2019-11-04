#!/bin/bash

logsDir=$HOME/.cache/unisonLogs
rm -rf $logsDir
mkdir -p $logsDir

counter=0
for preference_file in $(ls $HOME/.unison | grep prf); do
	filtered_preference_file=$(echo $preference_file | sed 's/.prf//g')
	unison -auto -batch $filtered_preference_file >> "$logsDir/$filtered_preference_file.log" 2>&1 &
  pids[${counter}]=$!
  pNames[${pids[$counter]}]=$filtered_preference_file
  counter=$((counter + 1))
done

for pid in ${pids[*]}; do
  notify-send "Unison Backup Status" "Waiting on ${pNames[$pid]}:$pid"
  wait $pid
done

notify-send "Unison Backup Complete" "Logs are located in ${logsDir}"


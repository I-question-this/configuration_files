#!/bin/bash

for preference_file in $(ls $HOME/.unison | grep prf)
do
	filtered_preference_file=$(echo $preference_file | sed 's/.prf//g')
	unison -auto -batch $filtered_preference_file
done

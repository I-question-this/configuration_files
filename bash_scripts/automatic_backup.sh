#!/bin/bash

DATE=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FOLDER="/home/tyler/unison_backup_logs"
mkdir -p $LOG_FOLDER
unison main_to_backup -auto -batch -ui text -silent &> $LOG_FOLDER/$DATE.log

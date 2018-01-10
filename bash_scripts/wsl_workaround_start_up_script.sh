#!/bin/sh

# Start up some services
sudo service cron start
sudo service ssh start

touch /home/tyler/test_if_it_run

# Keep the shell running
$SHELL

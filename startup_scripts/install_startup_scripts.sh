#!/bin/bash

# save variables for this hostname's pieces configuration
# bashrc is for interactive nonlogin shells and login shells (by being called in profile)
bashrc_pieces=specified_configurations/$(hostname)--Bashrc_Pieces
# profile is for login shells only
profile_pieces=specified_configurations/$(hostname)--Profile_Pieces

# make sure that pieces exist for this hostname
for file in $login_pieces $non_login_pieces; do
	if [[ ! -e  $file ]]; then
		echo $file does not exist
		exit -1
	else
		echo file exists
	fi
done

# make sym link to ours
ln -s -f $(realpath start_up_files/bashrc) $HOME/.bashrc
ln -s -f $(realpath start_up_files/bash_logout) $HOME/.bash_logout
ln -s -f $(realpath start_up_files/profile) $HOME/.profile
# make sym link to correct pieces
ln -s -f $(realpath $bashrc_pieces) $HOME/.bash_setting_pieces
ln -s -f $(realpath $profile_pieces) $HOME/.profile_setting_pieces
ln -s -f $(realpath pieces) $HOME/.bash_pieces

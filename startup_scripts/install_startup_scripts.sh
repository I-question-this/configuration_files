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

# delete existing bashrc, bash_logout, profile
rm -f $HOME/.bashrc
rm -f $HOME/.bash_logout
rm -f $HOME/.profile
# make sym link to ours
ln -s $(realpath start_up_files/bashrc) $HOME/.bashrc
ln -s $(realpath start_up_files/bash_logout) $HOME/.bash_logout
ln -s $(realpath start_up_files/profile) $HOME/.profile
# delete sym link to correct pieces if they exist
rm -f $HOME/.bash_setting_pieces
rm -f $HOME/.profile_setting_pieces
rm -f $HOME/.bash_pieces
# make sym link to correct pieces
ln -s $(realpath $bashrc_pieces) $HOME/.bash_setting_pieces
ln -s $(realpath $profile_pieces) $HOME/.profile_setting_pieces
ln -s $(realpath pieces) $HOME/.bash_pieces

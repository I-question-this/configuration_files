#!/bin/bash

########################################################################
#
#   Opens up movie.xyz files with variable numbers of molcules in the
#   the frames and centers them
#   Example Call: ./vmdCenterAtoms.sh movie.xyz molecule_id numberOfFrames moveByVector pbcSetVector
#
########################################################################

# Don't let the user put anything other than 5 arguments.
if [ $# -lt 5 ]
then
	cat <<- MYEND
		./vmdVarXyz movie.xyz molecule_id numberOfFrames moveByVector pbcSetVector
	MYEND
else
	file_name=$1; shift	# First element should be file_name
	molecule_id=$1; shift
	numberOfFrames=$1; shift
	moveByVector=$1; shift
	pbcSetVector=$1;
	
	# Create the vmd script
	# $$ is process id of the current shell
	
	cat > /tmp/$$_vmdCenterAtoms.tk <<- VMDSCRIPT
		topo readvarxyz $file_name
		center_atoms $molecule_id $numberOfFrames $moveByVector $pbcSetVector
	VMDSCRIPT
	
	vmd -e /tmp/$$_vmdCenterAtoms.tk
	
	rm /tmp/$$_vmdCenterAtoms.tk
fi

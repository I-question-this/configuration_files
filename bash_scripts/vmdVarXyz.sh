#!/bin/bash

########################################################################
#
#   Opens up movie.xyz files with variable numbers of molcules in the
#   the frames
#   Example Call: ./vmdVarXyz movie.xyz
#
########################################################################


# Don't let the user put anything other than 1 argument.
if [ $# -lt 1 ]
then
	cat <<- MYEND
		./vmdVarXyz movie.xyz
	MYEND
else
	file_name=$1; shift	# First element should be file_name
	
	# Create the vmd script
	# $$ is process id of the current shell
	
	cat > /tmp/$$_vmdVarXyz.tk <<- VMDSCRIPT
		topo readvarxyz $file_name
	VMDSCRIPT
	
	vmd -e /tmp/$$_vmdVarXyz.tk
	
	rm /tmp/$$_vmdVarXyz.tk
fi

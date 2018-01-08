#!/bin/bash

########################################################################
#
#   Opens up movie.xyz files with variable numbers of molcules in the
#   the frames and centers them. It then creates a data file for the
#	radial distrubtion function of the given atom selections
#   Example Call: ./vmdRadialDistrubtionFunction.sh movie.xyz molecule_id numberOfFrames moveByVector pbcSetVector atomSelection1 atomSelection2
#
########################################################################

# Don't let the user put anything other than 7 arguments.
if [ $# -lt 7 ]
then
	cat <<- MYEND
		./vmdVarXyz movie.xyz molecule_id numberOfFrames moveByVector pbcSetVector atomSelection1 atomSelection2
	MYEND
else
	file_name=$1; shift	# First element should be file_name
	molecule_id=$1; shift
	numberOfFrames=$1; shift
	moveByVector=$1; shift
	pbcSetVector=$1; shift
	atomSelection1=$1; shift
	atomSelection2=$1;
	
	# Create the vmd script
	# $$ is process id of the current shell
	
	cat > /tmp/$$_vmdRadialDistrubtionFunction.tk <<- VMDSCRIPT
		topo readvarxyz $file_name
		center_atoms $molecule_id $numberOfFrames $moveByVector $pbcSetVector
		
		#set up the atom selections
		set sel1 [atomselect top "$atomSelection1"]
		set sel2 [atomselect top "$atomSelection2"]

		#calculate g(r)
		set gr [measure gofr \$sel1 \$sel2 delta .1 rmax 10 usepbc 1 selupdate 1 first 0 last $(expr $numberOfFrames - 1) step 1]

		set up the outfile and write out the data
		set outfile [open gofr.dat w]

		set r [lindex \$gr 0]
		set gr2 [lindex \$gr 1]
		set igr [lindex \$gr 2]

		set i 0
		foreach j \$r k \$gr2 l \$igr {
		   puts \$outfile "\$j \$k \$l"
		}

		close \$outfile

		#exit vmd
		exit
	VMDSCRIPT
	
	vmd -e /tmp/$$_vmdRadialDistrubtionFunction.tk
	
	rm /tmp/$$_vmdRadialDistrubtionFunction.tk
fi

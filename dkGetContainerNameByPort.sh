#!/bin/bash


slister=dkcListPort.sh
cmds=$binroot/$slister
#echo $cmds
rcontainer=$($cmds | tr ":" " " | awk '/'$1'/ { print $2 }')

if [ "$rcontainer" == "" ]; then
	# Get from Stopped list
else # Print it out
	echo $rcontainer
fi

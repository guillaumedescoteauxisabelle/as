#!/bin/bash


slister=dkcListPort.sh
cmds=$binroot/$slister
#echo $cmds
rcontainer=$($cmds | tr ":" " " | awk '/'$1'/ { print $2 }')

if [ "$rcontainer" == "" ] ; then
	# Get from Stopped list
	echo "TODO get from  stopped and start it maybe"
else # Print it out
	echo $rcontainer
fi

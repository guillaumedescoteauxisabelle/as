#!/bin/bash


slister=dkcListPort.sh
cmds=$binroot/$slister
#echo $cmds
rcontainer=$($cmds | tr ":" " " | awk '/'$1'/ { print $1 }')

if [ "$rcontainer" == "" ] ; then
        # Get from Stopped list
        echo "TODO get from  stopped and start it maybe"
        #slister=dkcListStopped.sh
else # Print it out
	if [ "$2" == "" ]; then
        	echo $rcontainer
	else 
		echo $rcontainer | sed -e 's/90//'
fi

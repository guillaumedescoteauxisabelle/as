#!/bin/bash

#@STCGoal Refresh the variable for app requiring containers list
#@STCIssue Common sharing of the function 

if [ "$rwroot" != "" ]; then
	export dkrunningcontainers=$(cd $rwroot;./_adm__stopRemove_Containers__210502.sh --list | tr "\n" " " )
else
	#dkrunningcontainers
	export dkrunningcontainers=SOMEISSUES
fi

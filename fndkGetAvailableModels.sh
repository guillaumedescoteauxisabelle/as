#!/bin/bash

#@STCGoal A List of available port we can use along with the ability to list and know what model is deployed on it
#@STCIssue  We do not know what we can call and we might change inferencing scenarios.
cfilter="ast"
if [ "$rwroot" != "" ]; then
	export dkrunningcontainerports=$(cd $rwroot;./_adm__stopRemove_Containers__210502.sh --list --port | grep $cfilter)
	#| tr " " "\n"  )
	echo $dkrunningcontainerports > $wwwroot/data/dkrunningcontainerports.txt
else
	#dkrunningcontainers
	export dkrunningcontainers=SOMEISSUES
fi

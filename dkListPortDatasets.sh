#!/bin/bash

#@STCGoal What is the final result for this
#@STCIssue What is it transcending ? What is reality, the starting point.

#Loading functions
if [ -e $binroot/__fn.sh ]; then
	        source $binroot/__fn.sh $@
fi

###########DEbug
DEBUG=1
d "Debug is Active"

#Loads env if one in current dir (_env.sh)
envif $@


#@TODO Set the last ARG to the one required so it will exit if its not there
LASTREQUIREDARG=$0

#Looks if we used a quiet mode :  
#lookquiet $@

#########################################
#Displays the application usage and startup info
startapp "AST Containerization - List Port datasets" \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 [portCheck]
        portCheck will look if specified port is available, otherwise it list all of them"
#@TODO set usage  ABOVE
################################



dowork "MSG_WHEN_WE_GO"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)
local cdir=$(pwd)
cd $rwroot
if [ "$1" == "" ]; then
greps "export serverhostport=" sh | grep custom-start-docker-ast-| sed -e 's/custom-start-docker-ast-//g' | sed -e 's/export serverhostport=/ /g' | awk '// { print $8" "$6}' | sort
else 
	echo "Looking if $1 port is free..."
fi
cd $cdir
##############END CODING HERE and define EXIT CODE somehow
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE=""
########################################
donework "$MSG_WHEN_DONE" $EXIT_CODE 


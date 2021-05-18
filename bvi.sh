#!/bin/bash

#@STCGoal What is the final result for this
#@STCIssue What is it transcending ? What is reality, the starting point.

#Loading functions
if [ -e $binroot/__fn.sh ]; then
	        source $binroot/__fn.sh $@
fi

#bvi
#bvi.sh

################AUTOCOMPLETION
if [ "$1" == "--get-completions" ]; then #echo completion
	echo "$(cd $binroot;ls -tr *sh)"
        #getmodellist
        #getmodelcheckpoints $2
        exit 0
fi

###########DEbug
DEBUG=0
d "Debug is Active"

#Loads env if one in current dir (_env.sh)
envif $@


#@TODO Set the last ARG to the one required so it will exit if its not there
## Set to: NONE 	# if no args
LASTREQUIREDARG=$1
#LASTREQUIREDARG=NONE

#Looks if we used a quiet mode :  
lookquiet $@

#########################################
#Displays the application usage and startup info
startapp "Bin VI from anywhere " \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 <arg1>
        MORE" \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################



dowork "MSG_WHEN_WE_GO"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)
#(cd $binroot;git pull)
vi $binroot/$1
echo -n "Commit message (enter to skip):"
read cimsg
if [ "$cimsg" != "" ] || [ "$cimsg" != "\n" ]; then # We commit
	(cd $binroot ;git commit $1 -m "$cimsg" && git push)
fi


##############END CODING HERE and define EXIT CODE somehow
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE="We are done"
########################################
donework "$MSG_WHEN_DONE" $EXIT_CODE 


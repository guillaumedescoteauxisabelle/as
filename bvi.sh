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
startapp "Bin VI from anywhere + optional commit" \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 <arg1> [line number]
        bvi __fn.sh 444" \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################



dowork "MSG_WHEN_WE_GO"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)
#(cd $binroot;git pull)
if [ "$2" != "" ] ; then
	lcmf=$(echo "$2" | tr "+" " ")
		#sed -e 's/\+//')
	vi +$lcmf $binroot/$1
else 
	vi $binroot/$1
fi
echo "-----------@a-------------------------------"
echo "Commit message (enter to skip)"
echo -n "                    >>>>> "
read cimsg
if [ "$cimsg" != "" ] && [ "$cimsg" != "\n" ]; then # We commit
	(cd $binroot ;git add $1 &> /dev/null ; git commit $1 -m "$cimsg" &> /dev/null && echo " " && msg_info "GIA BVI has just Commited changes and is pushing in background silently..." && git push &> /dev/null || msg_failed "Comitting or pushing, sorry") &
fi



##############END CODING HERE and define EXIT CODE somehow
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE="We are done"
########################################
donework "$MSG_WHEN_DONE" $EXIT_CODE 


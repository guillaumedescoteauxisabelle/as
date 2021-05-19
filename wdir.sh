#!/bin/bash

#@STCGoal What is the final result for this
#@STCIssue What is it transcending ? What is reality, the starting point.

#Loading functions
if [ -e $binroot/__fn.sh ]; then
	        source $binroot/__fn.sh $@
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
startapp "Workdir  -  Nav" \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 <save|cd> [argOptionel]
        MORE" \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################



dowork "MSG_WHEN_WE_GO"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)
case "$1" in
	save)
		ecn r "Saving $1"
		if [ "$wdir" != "" ] ;then 
			echo "$wdir" >> /tmp/wdirs.txt  
		fi

		export wdir=$(pwd)
		ec g "$wdir as current project dir"

		pwd > /tmp/wdir__
		;;
	cd)
		#echo "Changing back to workdir $wdir"
		#cat /tmp/wdir__
		#if [ -e "/tmp/wdir__" ]; then 
		#	ec g "Reading";
		#	wdir="$(cat /tmp/wdir__)"
		#	. $binroot/_cd.sh "$wdir" && \ 
		#	ec b "Back in : $wdir" || echo "could not cd"
			#if [  "$?" == "0" ] ;then 
			#	msg_success "Read wdir"; 
			#else msg_error "Reading wdir failed" 
			#	
			#fi
		#fi

		if [ "$wdir" != "" ] ;then cd "$wdir" && msg_success "Going in"|| msg_failed "Could not cd the dir";fi
		;;
	*)
		echo "Usage: $0  save | cd"
		
esac



##############END CODING HERE and define EXIT CODE somehow
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE=""
########################################
#donework "$MSG_WHEN_DONE" $EXIT_CODE 


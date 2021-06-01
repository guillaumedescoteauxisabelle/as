#!/bin/bash

#@STCGoal Simply run Docker interactively with desired params
#@STCIssue Bunch of stuff to write docker run -it --rm -v /a:/a -v /home/jgi:/home/jgi ...

#Loading functions
if [ -e $binroot/__fn.sh ]; then
	        source $binroot/__fn.sh $@
fi

#dkrunit
#dkrunit.sh

################AUTOCOMPLETION
if [ "$1" == "--get-completions" ]; then #echo completion
        #echo "Autocompletion_UNDEFINED"
        echo 'vi_$binroot/etc/autocompletion/dkrunit.autocomplete'
        #echo "FILL_OUT_THIS_Section_in:$0:--get-completions"
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
startapp "dkrunit " \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 <containertag>  [Optionel other docker args]
        " \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################



dowork "MSG_WHEN_WE_GO"

#Here is what it does codified

docker run -it --rm \
	-v /a:/a \
	-v /home/jgi:/home/jgi \
	-v /home/jgi/.dropbox_uploader:/etc/.dropbox_uploader \
	-v /home/jgi/.dropbox_uploader:/root/.dropbox_uploader \
	$@ || msg_failed "Starting docker"


##############END CODING HERE and define EXIT CODE somehow
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE=""
########################################
donework "$MSG_WHEN_DONE" $EXIT_CODE 


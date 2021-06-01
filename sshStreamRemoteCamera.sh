#!/bin/bash

#@STCGoal Optimal capture setup to create pretty stylistic art
#@STCIssue No camera on my Ubuntu :(

#Loading functions
if [ -e $binroot/__fn.sh ]; then
	        source $binroot/__fn.sh $@
fi

#sshStreamRemoteCamera
#sshStreamRemoteCamera.sh

################AUTOCOMPLETION
if [ "$1" == "--get-completions" ]; then #echo completion
        #echo "Autocompletion_UNDEFINED"
        #echo 'vi_$binroot/etc/autocompletion/sshStreamRemoteCamera.autocomplete'
        #echo "FILL_OUT_THIS_Section_in:$0:--get-completions"
        #getmodellist
        #getmodelcheckpoints $2
        echo "pi@ueo"
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
startapp "sshStreamRemoteCamera - Script" \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 <arg1> <arg2> [argOptionel]
        MORE" \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################



dowork "MSG_WHEN_WE_GO"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)

#@STCGoal Optimal capture setup to create pretty stylistic art
#@STCIssue No camera on my Ubuntu :(
###################################
ssh pi@ueo ffmpeg -an -f video4linux2 -s 640x480 -i /dev/video0 -r 10 -b:v 500k -f matroska - | mplayer - -idle -demuxer matroska


##############END CODING HERE and define EXIT CODE somehow
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE=""
########################################
donework "$MSG_WHEN_DONE" $EXIT_CODE 


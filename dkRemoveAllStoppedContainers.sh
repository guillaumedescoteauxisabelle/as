#!/bin/bash
###############dkRemoveAllStoppedContainers################
## 
## @STCGoal Cleanup infrastructure
## @STCIssue Stopped container remains
##
## \mainpage
## \section Introduction
##   is a small Bash script that acts  ...
##  It provides...
##

## @file
## @author Guillaume Descoteaux-Isabelle <coding@guillaumeisabelle.com>
## @author Ethen Weader <Ethen.Weader@mentalos.com>
## @brief Script Cleanup infrastructure - Stopped container remains
## @copyright New BSD
## @version 0.1.0
## @par URL
## https://github.com/MentalOS
## https://github.com/GuillaumeIsabelle
## @par Purpose
## ...
##

##################################
# This part you wont touch UNTILHERE
#Loading functions
if [ -e $binroot/__fn.sh ] && [ "$FNLOADED" == "" ] || [ "$FNLOADED" == "-1" ]; then # If we have access to our functions, was never loaded or we do have to reload, we load, ya !!! go on.....
   source $binroot/__fn.sh $@
fi

###############################################
##     Logging and Debugging                  #
LOG_FILE=/var/log/gia/dkRemoveAllStoppedContainers.log; 
LOG_ENABLED=n
DEBUG=0
##############################################



#dkRemoveAllStoppedContainers
#dkRemoveAllStoppedContainers.sh

################AUTOCOMPLETION
if [ "$1" == "--get-completions" ]; then #echo completion
        #echo "Autocompletion_UNDEFINED"
        #echo 'vi_$binroot/etc/autocompletion/dkRemoveAllStoppedContainers.autocomplete'
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
#LASTREQUIREDARG=$1
LASTREQUIREDARG=NONE

#Looks if we used a quiet mode :  
lookquiet $@

#########################################
#Displays the application usage and startup info
startapp "dkRemoveAllStoppedContainers - Script" \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 \
	Cleanup infrastructure  \
	Stopped container remains	" \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################



dowork "MSGWHENWEGO"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)
#log_info "#@STCGoal Cleanup infrastructure"
#log_info "#@STCIssue Stopped container remains"
###################################
#@a##>>>>>######################################CODE HERE >>>>>
echo -n "Starting to do the work"

docker rm $(docker ps --filter "status=exited" -q) 2> /dev/null && echo " - Done the work" || echo " - There might be nothing to cleanup"

#@end##<<<<##########END CODING HERE and define EXIT CODE <<<<<<<
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE=""
########################################
donework "$MSGWHENDONE" $EXIT_CODE 


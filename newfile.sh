#!/bin/bash
###############newfile################
## 
## @STCGoal Stay in a Shell file creator
## @STCIssue If VIM, I loose what I see in the shell
##
## \mainpage
## \section Introduction
##   is a small Bash script that acts  ...
##  It provides...
##

## @file
## @author Guillaume Descoteaux-Isabelle <coding@guillaumeisabelle.com>
## @author Ethen Weader <Ethen.Weader@mentalos.com>
## @brief Script Stay in a Shell file creator - If VIM, I loose what I see in the shell
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
LOG_FILE=/var/log/gia/newfile.log; 
LOG_ENABLED=y
DEBUG=1
##############################################



#newfile
#newfile.sh

################AUTOCOMPLETION
if [ "$1" == "--get-completions" ]; then #echo completion
        #echo "Autocompletion_UNDEFINED"
        echo 'vi_$binroot/etc/autocompletion/newfile.autocomplete'
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
startapp "newfile - Script" \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 <arg1> <arg2> [argOptionel]
        Stay in a Shell file creator  \
	If VIM, I loose what I see in the shell	" \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################



dowork "MSGWHENWEGO"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)
log_info "#@STCGoal Stay in a Shell file creator"
log_info "#@STCIssue If VIM, I loose what I see in the shell"
###################################
#@a##>>>>>######################################CODE HERE >>>>>

read -r -d '' MYNEWFILECONTENT << DONE





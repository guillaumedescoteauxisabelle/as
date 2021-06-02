#!/bin/bash
###############tst-dkListPortDatasets################
## 
## @STCGoal Test looping foreach available port in the farm host
## @STCIssue We need to use what is hydrated, what best than read it at the source and be able to dynamically modify that
##
## \mainpage
## \section Introduction
##   is a small Bash script that acts  ...
##  It provides...
##

## @file
## @author Guillaume Descoteaux-Isabelle <coding@guillaumeisabelle.com>
## @author Ethen Weader <Ethen.Weader@mentalos.com>
## @brief Script Test looping foreach available port in the farm host - We need to use what is hydrated, what best than read it at the source and be able to dynamically modify that
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
LOG_FILE=/var/log/gia/tst-dkListPortDatasets.log; 
LOG_ENABLED=y
DEBUG=1
##############################################



#tst-dkListPortDatasets
#tst-dkListPortDatasets.sh

################AUTOCOMPLETION
if [ "$1" == "--get-completions" ]; then #echo completion
        #echo "Autocompletion_UNDEFINED"
	$binroot/fndkGetAvailableModelsAstPort.sh
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
startapp "tst-dkListPortDatasets - Script" \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 <arg1> <arg2> [argOptionel]
        Test looping foreach available port in the farm host  \
	We need to use what is hydrated, what best than read it at the source and be able to dynamically modify that	" \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################



dowork "MSGWHENWEGO"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)
log_info "#@STCGoal Test looping foreach available port in the farm host"
log_info "#@STCIssue We need to use what is hydrated, what best than read it at the source and be able to dynamically modify that"
###################################
#@a##>>>>>######################################CODE HERE >>>>>
for p in $($binroot/fndkGetAvailableModelsAstPort.sh); do #@a Loop thru available port on the asthost for inference
	echo "gia-ast somefile.jpg $p"
done
echo "That was quick and simple"

#@end##<<<<##########END CODING HERE and define EXIT CODE <<<<<<<
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE=""
########################################
donework "$MSGWHENDONE" $EXIT_CODE 


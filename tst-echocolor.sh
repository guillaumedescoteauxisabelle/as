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
LASTREQUIREDARG=$2
#LASTREQUIREDARG=NONE

#Looks if we used a quiet mode :  
lookquiet $@

#########################################
#Displays the application usage and startup info
startapp "Test echo Color - " \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 <color> <Content> 
        MORE" \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################



dowork "MSG_WHEN_WE_GO"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)
ec "red" "allo in red"
ec red "allo in red"
ec "green" "allo in green"
ec "yellow" "allo in yellow"
ec "blue" "Is this blue"
echo "normal echo, is it still green ?"
ec "reset" "back to normal"
ec r "Simply write in red"
ec b "hum, what color is this ?"

##############END CODING HERE and define EXIT CODE somehow
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE=""
########################################
donework "$MSG_WHEN_DONE" $EXIT_CODE 


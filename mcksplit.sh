#!/bin/bash

#@STCGoal What is the final result for this
#@STCIssue What is it transcending ? What is reality, the starting point.

#Loading functions
if [ -e $binroot/__fn.sh ]; then
	        source $binroot/__fn.sh $@
fi

#mcksplit
#mcksplit.sh

################AUTOCOMPLETION
if [ "$1" == "--get-completions" ]; then #echo completion
								
				if [ ! -d "checkpoint_long" ] ; then 
				exit 5
				#must be in a model folder to run this
					echo "Mush run in a root folder of a model to run this."
					echo "cd $modelroot;ls"
					exit 0
				fi
				modelname=$(basename $(pwd))
				getmodelcheckpoints $modelname

        # if [ "$2" == "" ]; then #no second args, showing models
				# 	getmodellist
				# else
				# 	modelname=$1
				# 	getmodelcheckpoints $modelname
				# fi
				# echo "good"
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
startapp "Model CheckPoint Splitter " \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 <checkpoint number> 
        MORE" \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################



dowork "Doing it"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)




##############END CODING HERE and define EXIT CODE somehow
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE=""
########################################
donework "$MSG_WHEN_DONE" $EXIT_CODE 


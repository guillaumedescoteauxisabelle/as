#!/bin/bash

#@STCGoal What is the final result for this
#@STCIssue What is it transcending ? What is reality, the starting point.

#cdr
#cdr.sh
#echo "$1"
flag=0
################AUTOCOMPLETION
if [ "$1" == "--get-completions" ]; then #echo completion
	#ls -d $libroot/results/*
	(cd $libroot/results; ls -dr */)
	exit 0
	flag=1
fi

#Loading functions
#if [ -e $binroot/__fn.sh ]; then
#                source $binroot/__fn.sh $@
#fi


###########DEbug
DEBUG=0
#d "Debug is Active"

#Loads env if one in current dir (_env.sh)
#envif $@


#@TODO Set the last ARG to the one required so it will exit if its not there
## Set to: NONE 	# if no args
#LASTREQUIREDARG=$1
LASTREQUIREDARG=NONE

#Looks if we used a quiet mode :  
#lookquiet $@

#########################################
#Displays the application usage and startup info
#startapp "CD Result util " \
#	 "Guillaume Descoteaux-Isabelle" \
#	  2021 \
#	  "
#Usage $0 [result sub dir] 
#        " $
	
#@TODO set usage  ABOVE
################################

#dowork "MSG_WHEN_WE_GO"

#if [ $flag == 0 ] ; then
	echo cd $libroot/results/$1
	cd $libroot/results/$1
#fi


##############END CODING HERE and define EXIT CODE somehow
#EXIT_CODE=0 #Define exit code
#MSG_WHEN_DONE=""
########################################
#donework "$MSG_WHEN_DONE" $EXIT_CODE 


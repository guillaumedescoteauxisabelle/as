#!/bin/bash

#@STCGoal What is the final result for this
#@STCIssue What is it transcending ? What is reality, the starting point.

#cdr
#cdr.sh
#echo "$1"
flag=0
################AUTOCOMPLETION
#if [ "$1" == "--get-completions" ]; then #echo completion
	logtype="running"
	#ls -d $libroot/results/*
	 echo "--------------------------------"  >> /var/log/gia/cdr.txt
	if [ "$1" == "--get-completions" ]; then logtype="autocompleting"; autocompleting="1"; shift;shift;fi #twice because we source this and once if we autocomplete
	echo "-----$(date)------[ $logtype ]------"  >> /var/log/gia/cdr.txt
	

	subpath="$libroot/results"
	ppath=$subpath
	echo " 1:$1,2:$2,3:$3" >> /var/log/gia/cdr.txt
	if ( [ "$1" != "" ] || [ "$autocompleting" != "1" ] ) &&  ( [ -e "$libroot/results/$1/$2/$3" ] || [ -e "$libroot/results/$1/$2" ]   || [ -e "$libroot/results/$1" ] ); then 
		echo "We have a : 1:$1,2:$2,3:$3" >> /var/log/gia/cdr.txt
		arr=("$@")
		for sp in ${arr[@]}; do 
			#if [ "$sp" != "$0" ]; then
				subpath="$subpath/$sp" 
				subdir=$sp
				if [ -d "$subpath" ]; then ppath=$subpath ; fi #if dir exist, we enter in for listing
			#fi
			
		done 
		#echo "Subpath: $subpath">> /var/log/gia/cdr.txt

		subpath=${subpath//\/\//\/}
		echo "Subpath: $subpath">> /var/log/gia/cdr.txt
	fi

################AUTOCOMPLETION
if [ "$1" == "--get-completions" ] || [ "$autocompleting" == "1" ]; then #echo completion
	echo "Listing : $subpath"  >> /var/log/gia/cdr.txt
	(cd $subpath; ls -dr */) || (cd $ppath ; ls -dr $subdir*/) ||  (cd $ppath ; ls -dr */)
	exit 0
	flag=1
fi
	echo "Subpath: $subpath"
	cd $subpath

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
	#echo cd $libroot/results/$1
	#cd $libroot/results/$1
#fi


##############END CODING HERE and define EXIT CODE somehow
#EXIT_CODE=0 #Define exit code
#MSG_WHEN_DONE=""
########################################
#donework "$MSG_WHEN_DONE" $EXIT_CODE 


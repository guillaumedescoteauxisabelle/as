#!/bin/bash

#@STCGoal What is the final result for this
#@STCIssue What is it transcending ? What is reality, the starting point.

#cdr
#cdr.sh
#log"$1"
flag=0



#Loading functions


if [ -e $binroot/__fn.sh ] && [ "$FNLOADED" != "1" ]; then
   source $binroot/__fn.sh $@ 
fi
LOG_FILE=/var/log/gia/cdr.txt
LOG_ENABLED=y


log "--------------------------------"


################AUTOCOMPLETION
#if [ "$1" == "--get-completions" ]; then #logcompletion
	logtype="running"
	#ls -d $libroot/results/*
	 log"--------------------------------"  >> $LOG_FILE
	if [ "$1" == "--get-completions" ]; then logtype="autocompleting"; autocompleting="1"; shift;shift;fi #twice because we source this and once if we autocomplete
	log"-----$(date)------[ $logtype ]------"  >> $LOG_FILE
	

	subpath="$libroot/results"
	ppath=$subpath
	log" 1:$1,2:$2,3:$3" >> $LOG_FILE
	if ( [ "$1" != "" ] || [ "$autocompleting" != "1" ] ) &&  ( [ -e "$libroot/results/$1/$2/$3" ] || [ -e "$libroot/results/$1/$2" ]   || [ -e "$libroot/results/$1" ] ); then 
		log"We have a : 1:$1,2:$2,3:$3" >> $LOG_FILE
		arr=("$@")
		for sp in ${arr[@]}; do 
			#if [ "$sp" != "$0" ]; then
				subpath="$subpath/$sp" 
				
				if [ -d "$subpath" ] && [ ! -d "$subpath/$sp" ] ; then subdir=$sp; ppath=$subpath ; fi #if dir exist, we enter in for listing
			#fi
			
		done 
		#log"Subpath: $subpath">> $LOG_FILE

		subpath=${subpath//\/\//\/}
		ppath=${ppath//\/\//\/}
		log"Subpath: $subpath">> $LOG_FILE
	fi

################AUTOCOMPLETION
if [ "$1" == "--get-completions" ] || [ "$autocompleting" == "1" ]; then #logcompletion
	log"Ppath: $ppath, subdir: $subdir"  >> $LOG_FILE
	log"--Trying to list --"  >> $LOG_FILE
	
	(cd $ppath &> /dev/null && ls -dr $subdir* && log"1" >> $LOG_FILE )   \
		|| (if [ -d "$subpath" ];then pwd  >> $LOG_FILE ; cd $subpath  &> /dev/null && pwd  >> $LOG_FILE  && ls -dr */ && log"2" >> $LOG_FILE ;else exit ; fi )  \
		||  (cd $ppath  &> /dev/null && ls -dr */ && log"3" >> $LOG_FILE )    

	exit 0
	flag=1
fi
	log"Subpath: $subpath"
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
	#logcd $libroot/results/$1
	#cd $libroot/results/$1
#fi


##############END CODING HERE and define EXIT CODE somehow
#EXIT_CODE=0 #Define exit code
#MSG_WHEN_DONE=""
########################################
#donework "$MSG_WHEN_DONE" $EXIT_CODE 


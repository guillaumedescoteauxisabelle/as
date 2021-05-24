#!/bin/bash

#@STCGoal What is the final result for this
#@STCIssue What is it transcending ? What is reality, the starting point.

#cdsrc
#cdsrc.sh
#log "$1"
flag=0



#Loading functions


if [ -e $binroot/__fn.sh ] && [ "$FNLOADED" == "" ]; then
   source $binroot/__fn.sh $@ 
fi
LOG_FILE=/var/log/gia/cdsrc.txt; LOG_ENABLED=y


log "--------------------------------"


################AUTOCOMPLETION
#if [ "$1" == "--get-completions" ]; then #logcompletion
	logtype="running"
	#ls -d $srcroot/results/*
	 log "--------------------------------"  
	if [ "$1" == "--get-completions" ]; then logtype="autocompleting"; autocompleting="1"; shift;shift;fi #twice because we source this and once if we autocomplete
	log "-----$(date)------[ $logtype ]------"  
	

	subpath="$srcroot/results"
	ppath=$subpath
	log " 1:$1,2:$2,3:$3" 
	if ( [ "$1" != "" ] || [ "$autocompleting" != "1" ] ) &&  ( [ -e "$srcroot/results/$1/$2/$3" ] || [ -e "$srcroot/results/$1/$2" ]   || [ -e "$srcroot/results/$1" ] ); then 
		log "We have a : 1:$1,2:$2,3:$3" 
		arr=("$@")
		for sp in ${arr[@]}; do 
			#if [ "$sp" != "$0" ]; then
				subpath="$subpath/$sp" 
				
				if [ -d "$subpath" ] && [ ! -d "$subpath/$sp" ] ; then subdir=$sp; ppath=$subpath ; fi #if dir exist, we enter in for listing
			#fi
			
		done 
		#log "Subpath: $subpath"

		subpath=${subpath//\/\//\/}
		ppath=${ppath//\/\//\/}
		log_status "Subpath: $subpath" 3
	fi

################AUTOCOMPLETION
if [ "$1" == "--get-completions" ] || [ "$autocompleting" == "1" ]; then #logcompletion
	log "Ppath: $ppath, subdir: $subdir"  
	log_status "--Trying to list $@--" 1
	ppathbase=$(basename $ppath)
	
	#if [ "$subdir" == "$ppathbase" ]; then
	#	(cd $ppath && ls * 2> /dev/null )
	#else
	(LOG_FILE=/var/log/gia/cdsrc.txt; LOG_ENABLED=y;\
		if [ "$ppathbase" != "$subdir" ] ; then \
			cd $ppath &> /dev/null && (ls -dr $subdir* 2> /dev/null || exit 1)  && log_success "1" || log_failed "1" && exit 1 ;else log_alert "1 skipped";exit 1 ; fi )    \
		|| \
		(LOG_FILE=/var/log/gia/cdsrc.txt; LOG_ENABLED=y;log "entering 2";\
		if [ -d "$subpath" ];then \
			log_info "$(pwd)";cd $subpath  &> /dev/null && log_info $(pwd) && log_info "ls -dr *" \
		      	&&  (ls -dr *  2> /dev/null || exit 1 ) && log "2" || log_failed "2"  ;else log_alert "2" ;exit 1; fi  ) \
		|| \
		(LOG_FILE=/var/log/gia/cdsrc.txt; LOG_ENABLED=y;log "entering 3";log_info "$(pwd)";\
		cd $ppath  &> /dev/null && log_info "$(pwd)" && ls -dr * 2> /dev/null    \
		&& log "3"  )
	#fi

	exit 0
	flag=1
fi



log "Subpath: $subpath"
cd $subpath






LASTREQUIREDARG=NONE

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
	#logcd $srcroot/results/$1
	#cd $srcroot/results/$1
#fi


##############END CODING HERE and define EXIT CODE somehow
#EXIT_CODE=0 #Define exit code
#MSG_WHEN_DONE=""
########################################
#donework "$MSG_WHEN_DONE" $EXIT_CODE 


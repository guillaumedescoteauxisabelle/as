#!/bin/bash

# Create / edit / commit / push

if [ -e $binroot/__fn.sh ]; then source $binroot/__fn.sh ; fi
envif

# we will be ask for commit msg
ci_args=""
if [ "$1" == "" ]  ; then
	echo "Usage $0 <ScriptName> \"[Commit message]\"
	   if not specified, you will be asked for commit msg
	"
	exit

fi
if [ "$2" != "" ]  ; then
	ci_args=" -m  \"$2\""
fi


cdir=$(pwd)

fn=$1
#cimsg=$2



cd $binroot
if [ -e "$fn" ];then 
	echo "File Already exist, Just editing.."
else
	echo "New file detected, initializing"
	cp templates/newscript.sh.txt $fn
	sleep 1
	echo "New file $fn initialized "
fi

vi $fn && chmod +x $_ && git add $_ && git commit $_  $ci_args && git push &&\
echo "$1 Created/edited and committed" ||
echo "$1 creation failed or something else was wrong"

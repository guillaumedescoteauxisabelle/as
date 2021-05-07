#!/bin/bash

# Create / edit / commit / push

if [ "$1" == "" ] || [ "$2" == "" ] ; then
	echo "Usage $0 ScriptName \"Commit message\"
	"
	exit

fi

fn=$1
cimsg=$2
binroot=/a/bin
(cd $binroot;vi $1 && git add $_ && git commit $_ && git push) &&\
echo "$1 Created and committed" ||
echo "$1 creation failed or something else was wrong"

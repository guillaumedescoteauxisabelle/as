#!/bin/bash

if [ "$1" == "" ] || [ "$2" == "" ]; then
	echo "$0 INPUTDIR OUTPUTDIR"
	exit
fi

thumbsup --input $1 --output $2 && \
echo "$2 created" || 
echo "$2 Failed to create"


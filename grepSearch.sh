#!/bin/bash

#@STCGoal Search in folder a pattern and learn where it is
if [ "" == "" ]; then
	echo "Usage : greps <Pattern to search in> [<Prefix pattern to search from> <Suffix ...> ]
	* greps bash_env .bash sh

	"
	exit
fi
for f in $2*$3; do
	echo "### $f"
	cat $f | grep $1
done


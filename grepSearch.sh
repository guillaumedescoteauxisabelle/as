#!/bin/bash

#@STCGoal Search in folder a pattern and learn where it is
if [ "$1" == "" ]; then
	echo "Usage : greps <Pattern to search in> [<Prefix pattern to search from> <Suffix ...> ]
	* greps bash_env .bash sh

	"
	exit
fi
pattern=$1
for f in $2*$3; do
#	echo "################################################################"
#	echo "###################################### $f ######################"
	pattern=$1
	#for f in *php ; do r=$(cat $f | grep $pattern);if [ "$r" != "" ]; then echo "----- $f" ; fi; done
	
	r=$(cat $f | grep $pattern)
	if [ "$r" != "" ]; then 
		echo "----- $f"  
	fi

	#cat $f | grep $1
done


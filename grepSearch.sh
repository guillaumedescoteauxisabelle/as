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
	#for f in *php ; do r=$(cat $f | grep $pattern);if [ "$r" != "" ]; then echo "----- $f" ; fi; done
	PASSED=$f

	if [ -d "${PASSED}" ] ; then
		echo "$PASSED is a directory - WE SKIP";
	else
		if [ -f "${PASSED}" ]; then
		
		else
			echo "${PASSED} is not valid";
			exit 1
		fi
	fi	

	pattern=$1
	
	r=$(cat $f | grep -n $pattern)
	if [ "$r" != "" ]; then 
		for p in $r ; do
			line=$(echo $p | tr ":" " "|awk '// { print $1 }')
			echo "-----vi +$line $f"  
			echo "$r"
			
		done
		RES+=' '$f
	fi
	return $RES

	#cat $f | grep $1
done


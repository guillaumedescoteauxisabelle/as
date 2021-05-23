#!/bin/bash

cdir=$(pwd)

for d in * 
do 
	if [ -d "$d" ] ; then
		echo -n "$d..."
		cd $d
		gis-csm -d  &> /dev/null || echo "Failed to start gis-csm" & 
		#sleep 1
		cd $cdir
		echo "...in progress"
	fi
done

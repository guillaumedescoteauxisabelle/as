#!/bin/bash
# Use to publish a strategy to a central repo

tdir=$CaishenIndicoreStrategiesDir
if [ -d "$CaishenIndicoreStrategiesDir" ]; then
	if [ -f "$1" ] ; then 
		echo "Publishhing $1 to $tdir"
		tar cf - "$1" | (cd $tdir;tar xvf -)
		if [ -e "$1.rc" ]; then
			tar cf - "$1.rc" | (cd $tdir;tar xvf -)
		fi
	else
		echo "Usage : $0 <strateegy lua filePath>"
	fi
else
	echo "export CaishenIndicoreStrategiesDir=MYSTRATEGYPATH"
	echo "\tex.  export ...=/c/Gehtsoft/IndicoreSDK3/strategies	"
fi

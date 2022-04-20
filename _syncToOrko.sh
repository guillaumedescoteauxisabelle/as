#!/bin/bash
#Sync from Orko
#$localmodelpath $remotemodelpath
if [ -e _env.sh ]; then #local or binroot
	source _env.sh
else
	source $binroot/_env.sh
fi

if [ -e _syncconf.sh ]; then #source local
	source _syncconf.sh "$1"
else
	source $binroot/_syncconf.sh "$1"
fi

if [ "$1" == " " ]; then # Need an argi
	echo "usage:  $0 <modelname>"
	exit 1
fi
rsync -aP $localmodelpath jgi@orko:$remotemodelroot/

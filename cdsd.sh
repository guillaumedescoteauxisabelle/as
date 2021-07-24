#!/bin/bash
mypath=$srcpath/gix-adaptive-style-transfer/bin-gpu/__context.sh
if [ -e $mypath ]; then
	source $srcpath/gix-adaptive-style-transfer/bin-gpu/__context.sh
	cd $savedir
else
	echo "there is no file yet in $mypath"
fi

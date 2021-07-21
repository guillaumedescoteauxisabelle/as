#!/bin/bash

#Download instead of uploading

#Loading functions
if [ -e $binroot/__fn.sh ]; then
     source $binroot/__fn.sh $@
fi

if [ "$1" == "" ]; then
	echo "Usage: $0 <lib fullpath locally>"
	exit 1
fi

#upload to droxul from lib without specifying as it reproduce the same path in Dropbox
##gia-ds-DavidBouchardGagnon-v01b-210510-864
echo $1
#mkdir -p $1
#cd $1
# sub the path for the dropbox path
#tdir=$(pwd)
td=$(echo "$(pwd)/$1" | sed -e 's/\/a\/lib/\/Lib/' | sed -e 's/\/c\/Users\/jeang\/Dropbox\/lib/\/Lib/') #/c/Users/jeang/Dropbox/lib
echo $td
#mkdir $td   &> /dev/null # make the dir if it does not exist and dont tell us anything if that does not work

# dl exerything
if [ "$1" == "--quiet" ] ; then
	droxul download $td  &> /dev/null
else 
	droxul download $td
fi


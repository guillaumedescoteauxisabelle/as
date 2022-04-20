#!/bin/bash

#Loading functions
if [ -e $binroot/__fn.sh ]; then
     source $binroot/__fn.sh $@
fi


#upload to droxul from lib without specifying as it reproduce the same path in Dropbox
tst=$(pwd | cut -c1-6)

# sub the path for the dropbox path
td=$(pwd | sed -e 's/\/a\/lib/\/Lib/' | sed -e 's/\/c\/Users\/jeang\/Dropbox\/lib/\/Lib/') #/c/Users/jeang/Dropbox/lib
tst=$(echo "$td" | cut -c2-4)
if [ "$tst" != "Lib" ]; then #@State we were not in the right place
	echo "Must be in a subdir of \$libroot.  ex.  /a/lib/results"
	exit 1
fi

droxul mkdir $td   &> /dev/null # make the dir if it does not exist and dont tell us anything if that does not work

# Upload exerything
if [ "$1" == "--quiet" ] ; then
	droxul upload * $td  &> /dev/null
else 
	droxul upload * $td 
fi


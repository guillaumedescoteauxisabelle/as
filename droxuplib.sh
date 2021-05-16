#!/bin/bash

#upload to droxul from lib without specifying as it reproduce the same path in Dropbox

# sub the path for the dropbox path
td=$(pwd | sed -e 's/\/a\/lib/\/Lib/' | sed -e 's/\/c\/Users\/jeang\/Dropbox\/lib/\/Lib/') #/c/Users/jeang/Dropbox/lib
droxul mkdir $td   &> /dev/null # make the dir if it does not exist and dont tell us anything if that does not work

# Upload exerything
droxul upload * $td 



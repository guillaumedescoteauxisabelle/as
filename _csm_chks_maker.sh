#!/bin/bash

# make a Contact sheet with each sub-dir checkpoints results
#export chks="15 30 45..." # defined globally

for c in $chks
 do 
	 echo "Processing: $c"
	 cd $c && gis-csm ../_$c.csm.jpg &
	 sleep 2

 done

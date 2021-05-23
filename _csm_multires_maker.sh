#!/bin/bash

# make a Contact sheet with each multi-res results

 for d in *x 
 do 
	 echo "Processing: $d"
	 cd $d && gis-csm ../_$d.csm.jpg &
	 sleep 2

 done

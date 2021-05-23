#!/bin/bash

for d in * 
do 
	cd $d
	gis-csm ../_$d.csm.jpg & 
	cd ..
done

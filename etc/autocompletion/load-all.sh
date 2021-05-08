#!/bin/bash 


cdir=$(pwd)
cd $binroot/etc/autocompletion

for f in *.autocomplete 
do
	. $f
done



cd $cdir

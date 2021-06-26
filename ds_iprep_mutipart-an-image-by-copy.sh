#!/bin/bash

f="$1"
parts=$2
ff=${f%.*}
ext="${f##*.}"
for i in $(seq 1 $parts); do
	
	echo cp $f $ff-$i.$ext

done


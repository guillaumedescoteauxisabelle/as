#!/bin/bash

#@STCGoal Search in folder a pattern and learn where it is
for f in $2*$3; do
	echo "### $f"
	cat $f | grep $1
done


#!/bin/bash

#@STCGoal 

if [ -e $binroot/__fn.sh ]; then source $binroot/__fn.sh ; fi

envif
exitifnoval "Usage $0 <container name> 
	Stop and remove a container
        " $1

#

echo "Stopping and deleting $1"
docker stop $1 && docker rm $1







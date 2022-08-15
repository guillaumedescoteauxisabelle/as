#!/bin/bash

#@STCGoal Start a container

if [ -e $binroot/__fn.sh ]; then 
        source $binroot/__fn.sh $@
fi

envif $@

DEBUG=0
lookquiet $@
startapp "Docker Utilities - Container Start" \
        "Guillaume Descoteaux-Isabelle" \
        2021 \
        " 
Usage dkstart <container name> 
	Start a container" \
        $1 #--quiet watch 

#exitifnoval "$appusage" $1


dowork $1 "Starting  $1" 


if [ "$QUIET" == "1" ]; then
docker start -t 1 $1  > /dev/null 2>&1 && \ 
        donework "SUCCESS" "$2" "$3" && exit 0 || \
        einq "FAILED" $2 && exit 1
else
docker start -t 1 $1    && \ 
        donework "SUCCESS" "$2" "$3" && exit 0 || \
        einq "FAILED" $2 && exit 1
fi

#echo $QUIET
exit



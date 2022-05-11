#!/bin/bash

#@STCGoal 

if [ -e $binroot/__fn.sh ]; then 
        source $binroot/__fn.sh $@
fi

envif $@

DEBUG=0
lookquiet $@
startapp "Docker Utilities - Container Stopper" \
        "Guillaume Descoteaux-Isabelle" \
        2021 \
        " 
Usage dkcrm <container name> 
	Stop a container" \
        $1 #--quiet watch 

#exitifnoval "$appusage" $1


dowork $1 "Stopping  $1" 


if [ "$QUIET" == "1" ]; then
docker stop -t 1 $1  > /dev/null 2>&1 && \
        donework "SUCCESS" "$2" "$3" && exit 0 || \
        einq "FAILED" $2 && exit 1
else
docker stop -t 1 $1    && \
        donework "SUCCESS" "$2" "$3" && exit 0 || \
        einq "FAILED" $2 && exit 1
fi

#echo $QUIET
exit



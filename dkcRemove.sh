#!/bin/bash

#@STCGoal 

if [ -e "$binroot/__fn.sh" ]; then 
        . $binroot/__fn.sh $@
fi

envif $@

DEBUG=0
lookquiet $@
startapp "Docker Utilities - Container remover" \
        "Guillaume Descoteaux-Isabelle" \
        2021 \
        " 
Usage dkcrm <container name> 
	Stop and remove a container" \
        $1 #--quiet watch 

#exitifnoval "$appusage" $1


dowork $1 "Stopping and deleting $1" 

#@STCGoal Registered service available
#@a Removing it
port=$(lp | grep $1 | tr ":" " " | awk '// {print $1}')


if [ -e "$gtpath/$port.json" ] ; then
        echo -n "Cleaning up $port in $gtpath"
        rm $gtpath/$port.json && echo "..done" || echo "failed to cleanup :( "

	(cd $gtpath && ls *json > list.txt) &
else
        echo "No file to cleanup for $port in :$gtpath"
fi

#@a do the work
if [ "$QUIET" == "1" ]; then
docker stop -t 1 $1  > /dev/null 2>&1 && \
        docker rm $1   > /dev/null 2>&1 && \
        donework "SUCCESS" "$2" "$3" && exit 0 || \
        einq "FAILED" $2 && exit 1
else
docker stop -t 1 $1    && \
        docker rm $1    && \
        donework "SUCCESS" "$2" "$3" && exit 0 || \
        einq "FAILED" $2 && exit 1
fi


#echo $QUIET
exit



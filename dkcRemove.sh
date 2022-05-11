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
port=$($binroot/dkcList.sh | grep $1 | tr ":" " " | awk '// {print $1}')
echo "Deregistering $port"


#TMP

export globallocationpath=/home/jgi/astiapreviz
export gtpath=$globallocationpath/svr/$HOSTNAME

if [ "$metaglobalregistryfeature" == "1" ] ; then 

if [ -e "$gtpath/$port.json" ] ; then
        echo -n "Cleaning up $port in $gtpath"
        rm $gtpath/$port.json && echo "..done" || echo "failed to cleanup :( "

	(cd $gtpath && ls *json > list.txt) &
else
        echo "No registration found for port:$port in registry path:$gtpath"
fi
else echo "global registration/deregistration disabled"
fi #global disable

#clean WWW Meta Svr
##httpserverserverhtdocs

if [ -e "$httpserverserverhtdocs/$port.json" ] ; then
        echo -n "Cleaning up Meta Svr $port in $httpserverserverhtdocs"
	rm $httpserverserverhtdocs/$port.json && echo "..done" || echo "failed to cleanup meta :( "

        (cd $httpserverserverhtdocs && ls *json > list.txt) &
	else
				        echo "No registration found for port:$port in registry path:$gtpath"
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



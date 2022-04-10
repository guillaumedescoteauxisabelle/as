#!/bin/bash


. .env &>/dev/null || . _env.sh || (echo "Could not load env (create .env or/and _env.sh" && exit)

#@STCGoal DKSvc start|stop for env
#@STCStatus creating it....

if [ "$1" == "" ]; then echo "Usage: $0 <start|stop>";
else
	_action="start"
	_tst=$(docker ps -a --filter "name=$containername" | awk '/'"$containername"'/')      

	if [ "$_tst" == "" ]; then echo "Must install container $containername"
	else
		docker $_action $containername
	fi


fi

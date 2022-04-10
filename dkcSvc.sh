#!/bin/bash


. .env &>/dev/null || . _env.sh || (echo "Could not load env (create .env or/and _env.sh" && exit)

#@STCGoal Okni 2204 AICollaborator service management script
#@STCStatus creating it....

if [ "$2" == "" ]; then echo "Usage: $0 <containername> <start|stop>";
else
	_action="start"
	 local _tst=$(docker ps -a --filter "name=$_containername" | awk '/'"$_containername"'/')      

	if [ "$_tst" == "" ]; then echo "Must install container $1"
	else
	docker $_action $1
	fi


fi

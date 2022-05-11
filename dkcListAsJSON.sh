#!/bin/bash


containers=$(docker ps | awk '{if(NR>1) print $NF}')


for container in $container ; do
	cports=$(docker container port $container | tr ":" " "| awk '/0.0.0.0/ { print $4}')
	echo $cports

done


docker container ps \
	 --format="{\"name\":\"{{.Names}}\",\"ports\":\"{{.Ports}}\",\"image\":\"{{.Image}}\",\"status\":\"{{.Status}}\"}" \ 
	--all | jq --slurp



#!/bin/bash


#@STCGoal Available list of model service available from network commands
# Most likely :  gia-ast --list

asthostserver=orko
dkrunningcontainerports.txt;
wget http://$asthostserver/data/dkrunningcontainerports.txt  > /dev/null 2>&1
dkrunningcontainerports=$(cat dkrunningcontainerports.txt) 
echo "$dkrunningcontainerports" | tr " " "\n"

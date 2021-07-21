#!/bin/bash

#@STCGoal A model is tarred on Dropbox for easy retrieval
#@Author Guillaume Descoteaux-Isabelle, 2021

if [ ! -d "$1" ] || [ "$2" == "" ]; then 
	#@Usage
	echo "-------------Model Drox Sync--------------------"
       echo "Usage: $0 <modelname> <droxul target path>"
       echo " -- Must run from model root $modelroot"
       exit 1
fi



m=$1
dxpath=$2

(tar cf /tmp/$m.tar $m/checkpoint_long/ && droxul upload /tmp/$m.tar $dxpath && $binroot/sns-publish.sh "Success Model Sync" "$dxpath just synced $m" ||  $binroot/sns-publish.sh "FAILED Model Sync" "$dxpathjust FAILED syncing $m")&
echo "--- Process will go in Background and echo stuff in here (like sync)"


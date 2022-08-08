#!/bin/bash


slister=dkcListPort.sh
cmds=$binroot/$slister
#echo $cmds
rcontainer=$($cmds | tr ":" " " | awk '/'$1'/ { print $2 }')
echo $rcontainer

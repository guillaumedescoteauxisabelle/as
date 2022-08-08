#!/bin/bash


slister=dkcListPort.sh
cmds=$binroot/$slister
#echo $cmds
$cmds | tr ":" " " | awk '/'$1'/ { print $2 }'


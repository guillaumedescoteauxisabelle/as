#!/bin/bash


slister=dkcListPort.sh

$binroot/$slister | tr ":" " " | awk '/90'$1'/ { print $2 }'


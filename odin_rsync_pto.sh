#!/bin/bash


rs() {
	local _lo=$1
	local _rl=$2
	echo "Sycing $_lo to :"
	echo "               	$_rl"
	rsync -r $_lo odin.jgwill.com:$_rl
}

lo=/mnt/c/Users/jeang/AppData/Local/Caishen/config
rl=/mnt/c/Users/jeang/AppData/Local/Caishen
rs $lo $rl

rs /c/var/lib/mssql/data/exports/csv /c/var/lib/mssql/data/exports

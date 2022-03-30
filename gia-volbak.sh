#!/bin/bash
export extprefix=giavolbak
export baksubfolder="."

command -v tlid >/dev/null 2>&1 || { echo >&2 "tlid is not installed.  Aborting.  try installing using : npm install tlid --g"; exit 1; }

dockertag="guillaumeai/server:util-volume-backup"


if [ "$1" == "" ]; then echo "usage: $0 <volumename> [--tlid] (add tlid to tarbz2 name)" 
else
	. .env &> /dev/null || . _env.sh &> /dev/null
	subfold="$giavolbaksubfolder"
	if [ "$subfold" == "" ] ; then subfold="." ; fi

	export fnb="$1.$giavolbak"
	export volumename="$1"
	if [ "$2" == "--tlid" ]; then fnb="$fnb.$(tlid)" ; fi
	export fn="$fnb.tar.bz2"
	export tfile="$subfold/$fn"
	echo "Backing up volume: $1 to file: $tfile" ; sleep 1
	docker run -v $volumename:/volume --rm --log-driver none $dockertag backup - > $tfile
fi



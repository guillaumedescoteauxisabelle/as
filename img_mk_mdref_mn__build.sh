#!/bin/bash

# Rebuild the index/thumnail and ref acrylics.md page and publish it
. .env &> /dev/null && . _env.sh &> /dev/null  || . _env.sh &> /dev/null 

## Acrylics
#export cdir=$(pwd)
buildmn() {
	local cdir=$(pwd)
	local bdir="$1"
	if [ "$bdir" == "" ]; then echo "Must supply a directory in the ./img/mydir";return;fi

	local imgdir="img"
	if [ "$2" != "" ]; then imgdir="$2"; fi

	local _disabledcommit="$3"
	if [ "$_disabledcommit" != "" ] ; then _disabledcommit=$disabledcommit;fi

(wdir=$imgdir/$bdir;cdir=$(pwd);cd $wdir && \
	. $binroot/_img_mk_mn_resizer.sh && \
	cd $cdir && \
	. $binroot/_img_mk_mdref_sheet.sh && echo "Rebuilted" && \
	(if [ "$_disabledcommit" == "" ] ; then git add $wdir/mn/*jpg $wdir/mncc/*jpg $wdir/*jpg $wdir/tn/*jpg  &> /dev/null ;git add $bdir.md &> /dev/null;git commit $bdir.md $wdir/mn/*jpg $wdir/mncc/*jpg $wdir/*jpg -m rebuilt:$bdir ;git push; fi ))
}

buildmn "$1" "$2" "$3"

# export bdir=acrylics-painting
#buildmn acrylics-painting
#buildmn ai-painting-collab

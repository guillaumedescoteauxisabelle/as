#!/bin/bash


if [ -e "$1" ] || [ "$1" == "" ] ; then # 
	echo "Usage: $0 <file> <target dir>"
else 

f="$1"
tdir="$2"
mkdir -p $tdir
tdir=$(cd $tdir;pwd) || exit 1

pointsize=42
tfont=Helvetica
bgcolor='#000000'
fillcolor='gray'

fn=${f%.*}
fl=$(echo "$fn" | sed -e 's/___/   /g' |sed -e 's/__/  /g'|sed -e 's/_/ /g');
out=$tdir/$fn'__L.jpg'
rx=$($binroot/imgGetResolution.sh $f x)
ry=$($binroot/imgGetResolution.sh $f y)
ry=$(expr $ry + $pointsize)
rval=$rx'x'$ry

DEBUG=1
dvar f fn fl r out tdir

montage -verbose -label "$fl" -font $tfont -pointsize $pointsize -geometry $rval -background "$bgcolor" -fill "$fillcolor" $f $out; 


fi

#feh -F $out

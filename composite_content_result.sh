#!/bin/bash

#@STCGoal A Montage that I love is made of the original content and the result

#@STCIssue I could not make that work - Might be nice to write where it was used and why ??
#@example cdir=$(pwd);ttdir=$cdir/_montage;mkdir -p $ttdir;for d in * ; do echo $d; cd $d; $binroot/composite_content_result.sh * $ttdir  ;cd $cdir ; done
#How smaller is the content relative to the render
contentscalefactor=2

f="$1"
f2="$2"
tdir="$3"
mkdir -p $tdir

tdir=$(cd $tdir;pwd) || exit 1
outL=$tdir/L
mkdir -p $outL

pointsize=42
labelheight=$(expr $pointsize + 25)
tfont=Helvetica
bgcolor='#000000'
fillcolor='gray'
fb=$(basename $f)
fb2=$(basename $f2)
fn=${fb%.*}
fn2=${fb2%.*}
fl=$(echo "$fn" | sed -e 's/___/   /g' |sed -e 's/__/  /g'|sed -e 's/_/ /g');
fl2=$(echo "$fn2" | sed -e 's/___/   /g' |sed -e 's/__/  /g'|sed -e 's/_/ /g');
out=$outL/$fn'__L.jpg'
out2=$outL/$fn2'__L.jpg'
outm=$tdir/$fn2'__M.jpg'
#rx=$($binroot/imgGetResolution.sh $f x)
#ry=$($binroot/imgGetResolution.sh $f y)
#ry=$(expr $ry + $pointsize)
#rval=$rx'x'$ry

# Making a scaled content factor
rx=$($binroot/imgGetResolution.sh $f2 x)
tqual=99
res=$(expr $rx '/' $contentscalefactor)
tmpcontent=$TMP/$f2
convert -quality $tqual -resize $res $f $tmpcontent && \
montage $tmpcontent $f2  -geometry +100+0  -background "$bgcolor" -fill "$fillcolor" $out && \
montage -label "$fl2" -font $tfont -pointsize $pointsize -geometry +0+$labelheight -background "$bgcolor" -fill "$fillcolor" $out $outm && \
 exiftool -overwrite_original -copyright="Guillaume Descoteaux-Isabelle &copy;2021" -E $outm && \
	echo "Suceeded creating $outm" || \
	echo "Failed creating $outm"
rm $tmpcontent
#feh -F $out

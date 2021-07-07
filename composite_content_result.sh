#!/bin/bash

#@STCGoal A Montage that I love is made of the original content and the result

#@STCIssue I could not make that work - Might be nice to write where it was used and why ??
#@example cdir=$(pwd);ttdir=$cdir/_montage;mkdir -p $ttdir;for d in * ; do echo $d; cd $d; $binroot/composite_content_result.sh * $ttdir  ;cd $cdir ; done
#How smaller is the content relative to the render
contentscalefactor=2

f="$1"
f2="$2"
tdir="$3"

if [ "$tdir" == "" ]; then # output in ./out of the second file if no output dir spec
	tdir=$(dirname $(realpath $f2))/out
fi

tdir=$(mkdir -p $tdir;cd $tdir;pwd) || (echo "Could not create or access $tdir" ;exit 1)
outL=$tdir/L
mkdir -p $outL

pointsize=48
labelheight=$(expr $pointsize + 25)
#tfont=Helvetica
tfont=Arial
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
echo -n "..."
rx=$($binroot/imgGetResolution.sh $f2 x)
tqual=99
res=$(expr $rx '/' $contentscalefactor)

#@STCIssue Point size too big for smaller size image
loweringfactor=0
if [ "$rx" -lt 1400 ] ; then loweringfactor=6 ;fi
if [ "$rx" -lt 1100 ] ; then loweringfactor=8 ;fi
if [ "$rx" -lt 900 ] ; then loweringfactor=10 ;fi
if [ "$rx" -lt 800 ] ; then loweringfactor=14 ;fi
if [ "$rx" -lt 700 ] ; then loweringfactor=18 ;fi
if [ "$rx" -lt 600 ] ; then loweringfactor=22 ;fi
tmppointsize=$(expr $pointsize - $loweringfactor)
pointsize=$tmppointsize
#@state Our pointsize got adjusted, hopefully more pleasant
copyright="Guillaume Descoteaux-Isabelle &copy;2021"
tmpcontent=$TMP/$f2
#@a The original is resized by a  factor, then a montage with the result image is then receiving an underlying label.
convert -quality $tqual -resize $res $f $tmpcontent && \
montage $tmpcontent $f2  -geometry +$pointsize+$pointsize  -background "$bgcolor" -fill "$fillcolor" $out && \
montage -label "$fl2" -font $tfont -pointsize $pointsize -geometry +0+$labelheight -background "$bgcolor" -fill "$fillcolor" $out $outm && \
 exiftool -overwrite_original -copyright="$copyright" -E $outm && \
	echo "Suceeded creating $outm" || \
	echo "Failed creating $outm"
rm $tmpcontent
#feh -F $out

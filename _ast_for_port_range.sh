#!/bin/bash

f=$1
fnb=${f%.*}
startport=$2
endport=$3
cdir=$(pwd)

label=pierre_to_jg_pikwill-v03-201216_ALL_LR2
labelprefix=PT__
label=$labelprefix'__'$fnb
lpath=Downloads__2101/7ART806
odir=$HOME/Dropbox/$lpath
xdir=samples-vue-des-artistes-210606
rdir=$odir/$xdir
fp='s_'$label
tdir=$rdir/$fp
ldir=/$lpath/$xdir/$fp

echo $tdir
mkdir -p $tdir
sleep 1

for p in $(seq $startport $endport); do
	echo $p
 	gia-ast $f $p
        echo mv $fnb'__stylize'*.jpg $tdir	
        mv $fnb'__stylize'*.jpg $tdir	


done

# Copy the content in the source as the first of the sequence
tcontentfile=$fnb'__000.jpg'
tctargetpath=$tdir/$tcontentfile
cp -f $f $tctargetpath

# Make the sheet
(cd $tdir; gis-csm -d --label --verbose) &
sleep 2
echo "See in $tdir"
# make a little HTML presenter
idx=index.html
#(cd $tdir ; for f in ./build/*.jpg; do echo 
#  Files and contact sheet are uploaded to the cloud directory
cd $tdir
droxul -q mkdir $ldir
sleep 5
droxul upload '../_'$fp*csm.* $ldir
for f in *jpg; do droxul -q upload $f $ldir ; done

#back
cd $cdir

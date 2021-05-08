#!/bin/bash
sleep 1
#@a PARAM TO UPDATE IN CONTEXT and integrate in arguments or in environment variables.
# Dropbox related path to $HOMEDIR
lpath=Downloads__2101/7ART806
#Label and prefix to created folders and files
label=PT_to_jg_compos51_56
labelprefix=PT__
#Subdir
xdir=samples-vue-des-artistes-210606
echo "
#@STCGoal One file is stylized with each port within range of specified port and 
USAGE: $0 <file> <startport> <endport>
";

f=$1
fnb=${f%.*}
startport=$2
endport=$3
cdir=$(pwd)

label=$labelprefix'__'$fnb
dropboxlocalpath=$HOME/Dropbox
odir=$dropboxlocalpath/$lpath
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
. /a/bin/gallery_html_maker.sh $tdir 'gal_'$tdir

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

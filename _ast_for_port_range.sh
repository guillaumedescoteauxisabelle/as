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
dropboxlocalpath=$HOME/Dropbox

echo "
#@STCGoal One file is stylized with each port within range of specified port and 
USAGE: $0 <file> <startport> <endport>
";

f=$1
startport=$2
endport=$3

giastcmd="gia-ast"
giastdefaultsuffix='__stylize'
galprefix='gal_'
giastdefaultext='jpg'
fpprefix='s_'
# Copy the content in the source as the first of the sequence
tcontentsuffix='__000'

fnb=${f%.*}
cdir=$(pwd)

label=$labelprefix'__'$fnb
odir=$dropboxlocalpath/$lpath
rdir=$odir/$xdir
fp=$fpprefix$label
tdir=$rdir/$fp
ldir=/$lpath/$xdir/$fp

csmtargetdir='..'
csmprefix='_'



tcontentfile=$fnb$tcontentsuffix.$giastdefaultext

echo $tdir
mkdir -p $tdir
sleep 1

for p in $(seq $startport $endport); do
	echo $p
 	$giastcmd $f $p
        echo mv $fnb$giastdefaultsuffix*.$giastdefaultext $tdir	
        mv $fnb$giastdefaultsuffix*.$giastdefaultext $tdir	


done


tctargetpath=$tdir/$tcontentfile
cp -f $f $tctargetpath

# Make the sheet
(cd $tdir; gis-csm -d --label --verbose) &
sleep 2
. /a/bin/gallery_html_maker.sh $tdir $galprefix$tdir

echo "See in $tdir"
# make a little HTML presenter
idx=index.html
#(cd $tdir ; for f in ./build/*.jpg; do echo 
#  Files and contact sheet are uploaded to the cloud directory
cd $tdir
droxul -q mkdir $ldir
sleep 5


droxul upload $csmtargetdir/$csmprefix$fp*csm.* $ldir
for f in *jpg; do droxul -q upload $f $ldir ; done

#back
cd $cdir

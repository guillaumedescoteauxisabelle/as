#!/bin/bash
#@STCGoal From what is being generated to adequate view to analyze and stimulate discussion
 #@a Separate by Content
 #@a A View of Each checkpoints for a content in one resolution
 #@a An adequate Web view
cdiro=$(pwd)
cdirbasenameo=$(basename $cdiro)
#tdir=$cdir'/../_montage-'$cdirbasename

$binroot/_result_by_content.sh  && \
cd $(pwd)'_by_content' && \
	cdir=$(pwd) && cdirbasename=$(basename $cdir) && \
	tdir=$cdir'/../_montage-'$cdirbasename && \
	echo "now in $(pwd)" && sleep 2 && \
	$binroot/composite_content_result__for__by_content.sh && \
$binroot/gallery_html_maker2.sh	$tdir $tdir'__gal' "$cdirbasename" " " "$cdirbasenameo" && 
echo "All Done (ResultByContent, Montage and Gallery, that was a hard job..." \
|| echo "Could not get in "$(pwd)'_by_content'




#@STCGoal Add the creation of the galery and its publication
#@STCResult  An accessible web site !

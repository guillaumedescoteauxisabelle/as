#!/bin/bash

#@STCGoal From what is being generated to adequate view to analyze and stimulate discussion
 #@a Separate by Content
 #@a A View of Each checkpoints for a content in one resolution
 #@a An adequate Web view
 #Loading functions
# Script as vars
reorderRenderByContentScript=$binroot/_result_by_content.sh
compositeContentFromResultByContent=$binroot/composite_content_result__for__by_content.sh
galleryMaker=$binroot/gallery_html_maker2.sh

if [ -e $binroot/__fn.sh ] && [ "$FNLOADED" == "" ]; then
   source $binroot/__fn.sh $@
fi
LOG_FILE=/var/log/gia/result_To_Montage_Pipeline-To_cloudNotified.sh.txt; LOG_ENABLED=y
log_info "Starting $0"
footertext="by Guillaume D.Isabelle, 2021"

cdiro=$(pwd)
log_info "Processing $cdiro"

cdirbasenameo=$(basename $cdiro)
#tdir=$cdir'/../_montage-'$cdirbasename
reorderRenderByContentReorderedTargetDir=$(pwd)'_by_content'
$reorderRenderByContentScript  && \
	log_success "Content reordered in : $reorderRenderByContentReorderedTargetDir" && \
	cd $reorderRenderByContentReorderedTargetDir && \
	cdir=$(pwd) && cdirbasename=$(basename $cdir) && \
	montagebasedir='_montage-'$cdirbasename && \
	tdirroot=$(cd $cdir/..; pwd) && \
	tdir=$tdirroot/$montagebasedir && \
	log_info "now in $(pwd)" && sleep 2 && \
	log_status "Montage" STARTING && \
	log_status "$tdir" OUTPUT && \
	$compositeContentFromResultByContent && \
	log_status "compositeContentFromResultByContent" COMPLETED && \
	log_status "GalleryMaker" STARTING && \
	galoutput= $tdir'__gal' && \
	log_status "$tdir" INPUT && \
	log_status "$galoutput" OUTPUT && \
	$galleryMaker $tdir $galoutput "$cdirbasename" "$footertext" "$cdirbasenameo" && \
	log_status "GalleryMaker" COMPLETED && \	
	log_info "Ready for distribution into out cloud storage" && \
echo "All Done (ResultByContent, Montage and Gallery, that was a hard job..." \
|| echo "Could not get in "$(pwd)'_by_content'




#@STCGoal Add the creation of the galery and its publication
#@STCResult  An accessible web site !

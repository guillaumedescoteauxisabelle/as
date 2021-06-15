#!/bin/bash

#@STCGoal From what is being generated to adequate view to analyze and stimulate discussion
 #@a Separate by Content
 #@a A View of Each checkpoints for a content in one resolution
 #@a An adequate Web view
 #Loading functions

# Script as vars

export reorderRenderByContentScript=$binroot/_result_by_content.sh
export compositeContentFromResultByContent=$binroot/composite_content_result__for__by_content.sh
export galleryMaker="$binroot/gallery_html_maker2.sh"

tclouddir=/home/jgi/astiapreviz
tcloudgetaddress=/home/jgi/astiapreviz/_getaddress.sh

#$tclouddir $tcloudgetaddress
if [ -e $binroot/__fn.sh ] && [ "$FNLOADED" == "" ]; then
   source $binroot/__fn.sh $@
fi
DEBUG=1
lvar reorderRenderByContentScript \
	compositeContentFromResultByContent \
	galleryMaker \
	tclouddir \
	tcloudgetaddress

export LOG_FILE=/var/log/gia/result_To_Montage_Pipeline-To_cloudNotified.sh.txt
dvar LOG_FILE
export LOG_ENABLED=y
log "-------------------------------------_"
log_info "Starting $0"

footertext="by Guillaume D.Isabelle, 2021"

export cdiro=$(pwd)
log_info "Processing $cdiro"

export cdirbasenameo=$(basename $cdiro)
#tdir=$cdir'/../_montage-'$cdirbasename
export reorderRenderByContentReorderedTargetDir=$(pwd)'_by_content'
if [ "$reorderRenderByContentReorderedTargetDir" != "/" ] ; then rm -rf $reorderRenderByContentReorderedTargetDir ; fi


#if [ "$1" == "--getargs" ] ; then return; fi
gal_suffix='__gal'
$reorderRenderByContentScript  && \
	log_success "Content reordered in : $reorderRenderByContentReorderedTargetDir" && \
	cd $reorderRenderByContentReorderedTargetDir && \
	cdir=$(pwd) && cdirbasename=$(basename $cdir) && \
	montagebasedir='_montage-'$cdirbasename && \ 
	tdirroot=$(cd $cdir/..; pwd) && \
	tdir=$tdirroot/$montagebasedir && \
	if [ "$tdir" != "/" ]; then rm -rf $tdir;fi && \
	gtbasedir=$montagebasedir$gal_suffix && \
	gtdir=$tdirroot/$gtbasedir && \
	if [ "$gtdir" != "/" ]; then rm -rf $gtdir; fi && \
	log_info "now in $(pwd)" && sleep 2 && \
	log_status "Montage" STARTING && \
	log_status "$tdir" OUTPUT && \
	$compositeContentFromResultByContent && \
	log_status "compositeContentFromResultByContent" COMPLETED && \
	cd .. && \
	log_info "cd to $(pwd)" && \
	log_status "GalleryMaker" STARTING && \
	log_status "$tdir" INPUT && \
	log_status "$gtbasedir" OUTPUT && \
	dvar montagebasedir tdirroot tdir gtbasedir gtdir && \
	echo "Cleanup montage dir before albumming" && if [ "$tdir/L" != "/L" ] ; then rm -rf $tdir/L;fi && \ 
	echo $galleryMaker $tdir $gtdir "$cdirbasename" "$footertext" "$cdirbasenameo" && \ 
	sleep 2 && \
	$binroot/gallery_html_maker2.sh $tdir $gtdir  "$cdirbasename" "$footertext" "$cdirbasenameo" && \ 
	log_status "GalleryMaker" COMPLETED && \
	log_info "Ready for distribution into out cloud storage" && \
	log_debug "Now in: $(pwd)" && \
	log_status "Distributing" STARTING && \
	log_status "$gtbasedir" INPUT && \
	tar cf - $gtbasedir | (cd $tclouddir && rm -rf $gtbasedir && tar xvf - && $tcloudgetaddress $gtbasedir --sns ) && \
	log_status "Distributing" COMPLETED || \
	log_status "Distributing or others" FAILED

#echo "All Done (ResultByContent, Montage and Gallery, that was a hard job..." \
#|| echo "Could not get in "$(pwd)'_by_content'

#$tclouddir $tcloudgetaddress


#@STCGoal Add the creation of the galery and its publication
#@STCResult  An accessible web site !

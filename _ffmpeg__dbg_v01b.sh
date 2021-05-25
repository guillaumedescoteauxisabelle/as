#!/bin/bash



if [ -e $binroot/__fn.sh ] && [ "$FNLOADED" == "" ]; then
   source $binroot/__fn.sh $@
fi
LOG_FILE=/var/log/gia/ffmpeg_montage.txt; LOG_ENABLED=y
DEBUG=1

#ffmpeg -framerate 25 -i %05d.jpg out.mp4


fr=8
cdir=$(pwd)
tdir=$(cd ..;pwd)
echo "Target output for video: $tdir"

sleep 3



for d in *x; do
	dn=$(echo "$d" | tr "/" "_")

	export tmplabeled2=$d'-labeled'
	mkdir -p $tmplabeled2 #|| exit 1

	tmptran=$tmplabeled2/_jpegtran
	mkdir -p $tmptran

	msg_info "Wer are in :$d"  
	 
	cd $d
	msg_status "Moved in $d" INFO

	msg_info "$(pwd)"
	
	sleep 1

	for f in *.jpg; do 
		cddir=$(pwd)
		
		#montage
		fn=${f%.*}
		#out file label
		fl=$(echo "$fn" | sed -e 's/___/   /g'|sed -e 's/__/  /g'|sed -e 's/_/ /g'); 
 		#our file resolution
		rx=$($binroot/imgGetResolution.sh "$f" x)
		ry=$($binroot/imgGetResolution.sh "$f" y)
		labelingheight=50
		ryfixed=$(expr $ry + $labelingheight)
		r=$rx'x'$ryfixed
		msg_debug "$r adjusted from $rx X $ry"

		dvar f 	fn fl r
		#dvar tmptran tmplabeled2
		out=$tmplabeled2/$f
	dvar out	

	
		echo "-geometry $r $f $out"
echo 		montage -label "$fl"  -pointsize 48 -geometry $r -font Helvetica $f $out

		#@state We have a montage with label in a tempdir tmplabeled2
		
		cd $tmplabeled2
		#mkdir outputdir
		#compatible for making video	
		jpegtran -optimize -copy none -perfect -v "$f" > "$tmptran/$f" &> /dev/null  && echo -n "."
		sleep 2
		cd $cddir
	done
	msg_success "...done jpegtran"
	
	msg_info "Moving in $tmptran"

	cd $tmptran
	montagevideofile=$tdir/$dn'_fr'$fr'_full.mp4'
	fn=$(echo $d | sed -e 's/\///g') && \
		 ffmpeg   -framerate $fr -i %05d.jpg -codec copy  $tmontagevideofile && msg_success "Done montage of $d" || msg_failed "montage of $d failed"

	cd $cdir
#	rm -rf $tmplabeled2
done

echo "might be ok in $tdir"


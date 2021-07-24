#!/bin/bash



if [ -e $binroot/__fn.sh ] && [ "$FNLOADED" == "" ]; then
   source $binroot/__fn.sh $@
fi
LOG_FILE=/var/log/gia/ffmpeg_montage.txt; LOG_ENABLED=y
DEBUG=1

#ffmpeg -framerate 25 -i %05d.jpg out.mp4


fr=1
cdir=$(pwd)
tdir=$(cd ..;pwd)
echo "Target output for video: $tdir"

sleep 1



for d in *x; do
	dn=$(echo "$d" | tr "/" "_")
	df=$(cd $d;pwd)
	export tmplabeled2=$df'-labeled'
	mkdir -p $tmplabeled2 #|| exit 1

	tmptran=$tmplabeled2/_jpegtran
	rm -rf $tmptran &> /dev/null
	mkdir -p $tmptran

	msg_info "Wer are in :$d"  
	 
	cd $df
	msg_status "Moved in $d" INFO

	msg_info "Entered: $(pwd)"
	
	sleep 1
	DEBUG=0
	sn=0
	for f in *.jpg; do 
		#we will export a padded sequence for the jpegtran (as they were labeled alneady)
		snpadded=`printf %05d $sn` 
		

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
		log_debug "$r adjusted from $rx X $ry"

		lvar f 	fn fl r
		#dvar tmptran tmplabeled2
		out=$tmplabeled2/$f
		

	
	#	echo "-geometry $r $f $out"
	#	echo "----------------------------------------"
 	#	echo montage -verbose -label "$fl"  -pointsize 48 -geometry $r -font Helvetica $f $out
	#	echo "-------------------------------------------"
	        lvar out	
	#	pwd
		echo -n "."
 		montage -label "$fl"  -pointsize 48 -geometry $r -background black -font Helvetica "$f" "$out" && echo -n "." || msg_warning "montage failed $f"
		
		#@state We have a montage with label in a tempdir tmplabeled2
		
		cd $tmplabeled2
		#mkdir outputdir
		#compatible for making video
	#jpegtran -optimize -copy none -perfect -v "	
		jpegtran -optimize -copy none -perfect -v "$f" > "$tmptran/$snpadded.jpg" &> /dev/null  && echo -n "."
	#	msg "Going back to $cddir"
	
		cd $cddir

		#inc our seq
		sn=$(expr $sn + 1)
	done
	DEBUG=1
	msg_success "...done jpegtran and montage"
	
	msg_info "Entering $tmptran"

	cd $tmptran
	pwd
	sleep 2
	montagevideofile=$tdir/$dn'_fr'$fr'_full.mp4'
	dvar montagevideofile
	
	fn=$(echo "$d" | sed -e 's/\///g')
	dvar fn
	d "Ready for running ffmpeg"
	echo  ffmpeg -framerate $fr -i %05d.jpg -codec copy $montagevideofile 
	sleep 8
	ffmpeg -framerate $fr -i %05d.jpg -codec copy "$montagevideofile" && msg_success "Done building Video of $d" || msg_failed "Failed building of $d failed"

	cd $cdir
#	rm -rf $tmplabeled2
done

echo "might be ok in $tdir"


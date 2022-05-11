#!/bin/bash


if [ "$1" == "--help" ]; then 
	echo "Usage: $0 [resized res]"
	exit 1
fi

# Resize in a subdir created with above res suffix
resolution=864

if [ "$1" != "" ]; then # We have specified a different res 
	resolution=$(echo "$1" | sed -e 's/x//')
	echo "Custom resolution specified: $resolution"
	sleep 1

fi

tsize=$resolution'x'

tdir=$(pwd)'-'$tsize
mkdir -p $tdir
tqual=100

tres=$tsize
tdir="$(pwd)-$tres"
mkdir -p $tdir
dsresizer() {
	local tqual=$1;local res=$2;local f=$3;local targetfilepath=$4
	if [ -e "$f" ] ; then 
		convert -quality $tqual -resize $res $f $targetfilepath && echo -n "." || echo "Error with $f"
	fi


}
for f in *.jpg *.png ; do 
	if [ "$f" != '*.jpg' ] &&  [ "$f" != '*.png' ] ; then 
	
		res=$($binroot/imgGetResolution.sh $f m $tres)
		#@status, those bellow desired res wont be resized
		rx=$($binroot/imgGetResolution.sh $f x)
		ry=$($binroot/imgGetResolution.sh $f y)

		ff=${f%.*}
		targetfilepath=$tdir/$ff.jpg
		ext="${f##*.}"

		#@a If one of the two resolution are higher that the desired resolutio, we resize
		if [ $rx -gt $resolution ]  ||  [ $ry -gt $resolution ] || [ "$ext" != "jpg" ]; then 
			#convert -quality $tqual -resize $res $f $targetfilepath && echo -n "." || echo "Error with $f" 

			#conditional message - resolution changes or format changes
			msg="Resized $f done"
			if  [ "$ext" != "jpg" ]; then msg="Format changed for $f" ; fi

			dsresizer $tqual $res "$f" "$targetfilepath" && \
			echo "$msg" || \
			echo "Failed processing $f"
			
		else
			#a Plain copy as the resolution is ok how it is
			#@STCIssue Might be interesting to enhance resolution to desired using neural net
			
			cp "$f" "$targetfilepath" && echo "Resolution of $f ok, simple copy done" || echo "ERROR while copying to $targetfilepath"
		fi
	fi
done
echo "done.  cd $tdir"


#OLD
exit
for f in *.jpg *.png; 
	do 
		ff=${f%.*}
		convert -quality $tqual -resize $tsize  $f $tdir/$ff.jpg \
		       	&& echo "Converted to $tdir/$f"
	done


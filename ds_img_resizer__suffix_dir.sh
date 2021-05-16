

# Resize in a subdir created with above res suffix
tsize=864x
if [ "$1" != "" ]; then # We have specified a different res 
	tsize=$(echo "$1" | sed -e 's/x//')'x'
fi


tdir=$(pwd)'-'$tsize
mkdir -p $tdir
tqual=100

tres=$tsize
tdir="$(pwd)-$tres"
mkdir -p $tdir
for f in *.jpg *.png ; do 
	if [ "$f" != '*.jpg' ] &&  [ "$f" != '*.png' ] ; then 
	
		res=$($binroot/imgGetResolution.sh $f m $tres)
	
		ff=${f%.*}
	
		convert -quality $tqual -resize $res $f $tdir/$ff.jpg && echo -n "." || echo "Error with $f"
	fi
done
echo "done"


#OLD
exit
for f in *.jpg *.png; 
	do 
		ff=${f%.*}
		convert -quality $tqual -resize $tsize  $f $tdir/$ff.jpg \
		       	&& echo "Converted to $tdir/$f"
	done


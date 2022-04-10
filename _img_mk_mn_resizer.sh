mnresizer() {
	local _tres="$2"
	local _tdir=$1

	local _tqual="$3"
	if [ "$_tqual" == "" ]; then _tqual=100; fi
	mkdir -p $tdir
	for f in *jpg; do
		 convert "$f" -resize $_tres'x' -quality $_tqual "$_tdir/$f"
	done
	for f in *png; do 
		convert "$f" -resize $_tres'x' -quality $_tqual "$_tdir/$f"
	done
}

# Normal
tres=600
tqual=100
tdir=mn;mkdir -p $tdir
for f in *jpg; do 
	convert "$f" -resize $tres'x' -quality $tqual "$tdir/$f"
done

# tn
mnresizer tn 150 80

# Center cropped
tdir=mncc;mkdir -p $tdir
for f in *jpg; do 
	convert "$f" -resize $tres'x'$tres\! -quality $tqual "$tdir/$f"
done

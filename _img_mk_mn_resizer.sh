#mnresizer() {
#	local _tres="$2"
#	local _tdir=$1

#	local _tqual=100
#	if [ "$3" != "" ]; then _tqual=$3; fi
#	mkdir -p $tdir
#	for f in *jpg; do
#		 convert "$f" -resize $_tres'x' -quality $_tqual "$_tdir/$f"
#	done
#	for f in *png; do 
#		convert "$f" -resize $_tres'x' -quality $_tqual "$_tdir/$f"
#	done
#}
SDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ "$FNLOADED" == "" ]; then . $SDIR/__fn.sh; fi


# Normal
tres=600
tqual=100
tdir=mn

mkdir -p $tdir
for f in *jpg; do 
	convert "$f" -resize $tres'x' -quality $tqual "$tdir/$f"
done

# tn
mnresizer tn 150 80

# HD
if [ "$renderhd" == "true" ] || [ "$1" == "hd" ] ; then mnresizer hd 1920 ;fi
if [ "$renderhdy" == "true" ] || [ "$1" == "hdy" ] || [ "$1" == "hd_y" ]; then mnresizer hd_y 1080 ;fi

# Center cropped
tdir=mncc
mkdir -p $tdir
for f in *jpg; do 
	convert "$f" -resize $tres'x'$tres\! -quality $tqual "$tdir/$f"
done


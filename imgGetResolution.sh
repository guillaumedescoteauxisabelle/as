#!/bin/bash

# Get size X or Y of an image
imggetinfousage () {
 	echo $"Usage $0 <file> [x|y|s|e|r|m] [m value]"
	echo "--------------------------"
        echo "$0 my.jpg  #555x888"
        echo "$0 my.jpg x  #555"
        echo "$0 my.jpg m 333 #x333"
	echo "s :  both without the x, r: Ratio, e: Which has largest ratio (x or y)"
	echo "m: output a size for convert  x888 or 888x"
	echo "----------------"
	echo ' for f in *jpg ; do $binroot/imgGetResolution.sh $f m 864 ; done'
	echo "-----------------------------------"

	echo 'tres=864;tdir="$(pwd)-$tres";mkdir -p $tdir;for f in *jpg *.png ; do res=$($binroot/imgGetResolution.sh $f m $tres);ff=${f%.*};convert -quality 99 -resize $res $f $tdir/$ff.jpg; done'

	exit 1

}
if [ "$1" == "" ] ||  [ "$1" == "--help" ] ||  [ ! -f "$1" ]; then imggetinfousage; fi
if  [ ! -f "$1" ]; then echo "File does not exist " ;exit 1;fi

f=$1
v=$2

x=0
y=0
ratio=0

id=$(identify $f)
r=$(echo "$id" | sed -e 's/JPEG/JPG/'|  awk '// { print $3 }')
if [ "$2" != "" ]; then #we desire one side
	vv=$(echo "$r" | tr "x" " ")
	x=$(echo "$vv" | awk '// { print $1 }' )
	y=$(echo "$vv" | awk '// { print $2 }' )
	tsize=$x

	#ratio
	ratio=$(( 100 * $x / $y ))
	rv=$(echo "$ratio" | sed -e 's/..$/.&/;t' -e 's/.$/.0&/') 
	lr=e ## largest side
	if (( $ratio > 100 )) ; then lr=x ; else  if (( $ratio < 100 )) ; then tsize=$y;lr=y; else lr=e;fi;fi # which is higher

	case "$v" in
		x)	r=$x
			;;
		y)	r=$y	
			;;
		s)	r="$vv" #we desire both without the x
			;;
		e)	r="$lr"
			;;
		r)	r=$rv	# Output ratio only
			;;
		m)	# value for image magick of a ratio
			#  864x will resize when larger on x
			#  x864 will resize in y
			if [ "$3"  != "" ]; then #we have spec a value in the shell for the output
				tsize=$3
			fi
			if [ "$lr" == "x" ]; then
				r='x'$tsize	
			else
				r=$tsize'x'
			fi
			;;
		?)
			imggetinfousage
			


	esac	

	


fi
#echo $2	
echo "$r"

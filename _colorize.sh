#!/bin/bash
tint=150
ext=jpg
echo "Colorizing... see in ./sepia"
basedir="_cc"
colors="blue darkcyan firebrick  goldenrod gold khaki wheat"

############## Doing the things
mkdir -p $basedir
for color in $colors 
	do 
		export xdir="$basedir/$color"
		mkdir -p $xdir
		for f in *.$ext
			do 
				echo $f
				convert $f -fill $color -tint $tint $xdir/${f%.*}'_'$color'.'$ext
			done  
	done

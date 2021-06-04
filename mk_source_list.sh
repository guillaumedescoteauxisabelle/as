#!/bin/bash

# source list is make that we can use for processing
cdir=$(pwd)
rm $cdir/_srcfiles.txt &> /dev/null
for d in *; do 
	
	if [ -d "$d" ] ; then 
		cd "$d" 
		# enable/disable using .{jpg,JPG,png,PNG} shopt -s nullglob # Sets nullglob / shopt -u nullglob # Unsets nullglob
		shopt -s nullglob # Sets nullglob
		for f in *.{jpg,JPG,png,PNG} ;do
			#echo "$f"
			echo -n "."
			#sleep 1
		#	if [ "$f" != '*.jpg' ] &&  [ "$f" != '*.JPG' ] && [ "$f" != '*.png' ] && [ "$f" != '*.PNG' ] ;then	
				bn=$(basename "$f")
				ff=${bn%.*}
				if [ -f "$f" ]; then echo "$ff" >> $cdir/_srcfiles.txt ; fi
		#	fi
		done 
		shopt -u nullglob # Unsets nullglob
		cd $cdir
	fi
done


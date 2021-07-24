#!/bin/bash

# Split into dir all CHKS using ln -sf so we dont dup
chks="$1"
export basedir=chks
mkdir -p $basedir
odir=$(pwd)
for c in $chks
 do 
	 tdir=$basedir/$c
	 mkdir -p $tdir 
	 cd $tdir 
	 for f in $(ls $odir/*_$c'k.jpg'); do
		 
		 nn=$(basename $f)
		 if [ ! -e "$nn" ] ; then ln -sf $f "$nn" 
			 else 
			 	echo -n "."
			 fi

	 done
	 cd $odir
done


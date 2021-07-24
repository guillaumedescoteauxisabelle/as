#!/bin/bash

cdir=$(pwd)
ftag=$(basename $cdir)
echo "$cdir"
sleep 1
tdir=$cdir'_by_content'
. $binroot/__cpcontentfn.sh

OLDloopcpcontent() {

	srcfile="$1"
	tdir="$2"
	ftag="$3"
	for c in $(cat "$srcfile"); do 
		tcdir="$tdir/$c" 
		if [ ! -d "$tcdir" ] ; then 
			mkdir -p "$tcdir" 
			echo -n "."
                fi

                cp "$c"_"$ftag"*jpg "$tcdir" &> /dev/null  && \
                      echo -n "."

        done

}
OLDcpcontent() {
	c=$1
	tdir=$2
	cd $libroot/samples
	for d in $(ls -d *) ; do
		 if [ ! -d "$d" ] ; then 
			 cd $d
			 cp $c.jpg $tdir &> /dev/null || \
			 cp $c.png $tdir &> /dev/null || \
			 cp $c $tdir &> /dev/null 
		fi
		 cd $libroot/samples
	done
	cd $libroot/datasets 
	for d in $(ls -d *) ; do 
		if [ ! -d "$d" ] ; then 
			cd $d 
			cp $c.jpg $tdir &> /dev/null  || \
			cp $c.png $tdir &> /dev/null  || \
			cp $c $tdir &> /dev/null 
		fi 
		cd $libroot/datasets
	done
	}

#refreshing the local src liste
$binroot/mk_source_list.sh &

for d in $(ls -d *); do 
	echo "Processing $d..."
	
	if [ -d "$d" ] ;then 
		
		cd "$d"
		for c in $(cat $libroot/samples/_srcfiles.txt); do 
			tcdir="$tdir/$c" 

			if [ ! -d "$tcdir" ] ; then
				mkdir -p "$tcdir"
				echo -n "."
			fi

			cp "$c"_"$ftag"*jpg "$tcdir" &> /dev/null  && \
                                 echo -n "." && \
				 cpcontent $c $tcdir &

			

		done 

                for c in $(cat /$libroot/datasets/_srcfiles.txt); do

			#make a dir named as the content without ext
                        tcdir="$tdir/$c"
                        if [ ! -d "$tcdir" ] ; then
                                mkdir -p "$tcdir"
                       		echo -n "."
                        fi

			#copy out file pattern matching out ftag and content name
                        cp "$c"_"$ftag"*jpg "$tcdir" &> /dev/null && \
				 echo -n "." &&  cpcontent $c $tcdir &
                done
		


                for c in $(cat $cdir/_srcfiles.txt); do

                        #make a dir named as the content without ext
                        tcdir="$tdir/$c"
                        if [ ! -d "$tcdir" ] ; then
                                mkdir -p "$tcdir"
                                echo -n "." 
                        fi

                        #copy out file pattern matching out ftag and content name
                        cp "$c"_"$ftag"*jpg "$tcdir" &> /dev/null && \
                                 echo -n "."
                done




	else 
		echo "skipping $d, not a directory ;)"
	fi
	cd $cdir
	echo "...done $d"
done
rmdir $tdir/* &> /dev/null

#@TODO Copy the original content to the target content dir

cd $tdir
#@state We have a folder called by out content name
#@state we have /a/lib samples+datasets where content are
#@states we have results in $cdir that might have been reused in rendering


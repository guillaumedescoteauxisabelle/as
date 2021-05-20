cdir=$(pwd)
ftag=$(basename $cdir)
echo "$cdir"
sleep 1
tdir=$cdir'_by_content'

for d in $(ls -d *x); do 
	echo "Processing $d..."
	
	if [ -d "$d" ] ;then 
		
		cd "$d"
		for c in $(cat /a/lib/samples/_srcfiles.txt); do 
			tcdir="$tdir/$c" 

			if [ ! -d "$tcdir" ] ; then
				mkdir -p "$tcdir"
				echo -n "."
			fi

			cp "$c"_"$ftag"*jpg "$tcdir" &> /dev/null  && \
                                 echo -n "."

		done 

                for c in $(cat /a/lib/datasets/_srcfiles.txt); do

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


cdir=$(pwd)
ftag=$(basename $cdir)
echo "$cdir"
sleep 1
tdir=$cdir'_by_content'

for d in $(ls -d *x); do 
	echo "$d..."
	
	if [ -d "$d" ] ;then 
		
		cd "$d"
		for c in $(cat /a/lib/samples/_srcfiles.txt); do 
			tcdir="$tdir/$c"
			if [ ! -d "$tcdir" ] ; then
				mkdir -p "$tcdir"
				echo "made $tcdir"
			fi

			echo -n "."
			cp "$c"_"$ftag"*jpg "$tcdir" &> /dev/null 
		done 

                for c in $(cat /a/lib/datasets/_srcfiles.txt); do
                        tcdir="$tdir/$c"
                        if [ ! -d "$tcdir" ] ; then
                                mkdir -p "$tcdir"
                                echo "made $tcdir"
                        fi

                        echo -n "."
                        cp "$c"_"$ftag"*jpg "$tcdir" &> /dev/null
                done

	else 
		echo "not a dir"
	fi
	cd $cdir
	echo " "
done
rmdir $tdir/* &> /dev/null


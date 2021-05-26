
loopcpcontent() {

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
cpcontent() {
	c=$1
	tdir=$2
	cdir=$(pwd)
	mkdir -p $tdir
	tdir=$(cd $tdir;pwd)

	cd $libroot/samples
	for d in $(ls -d *) ; do
		 if [ -d "$d" ] ; then 
			 cd $d && \
			 (cp $c.jpg $tdir &> /dev/null || \
			 cp $c.png $tdir &> /dev/null || \
			 cp $c.JPG $tdir &> /dev/null || \
			 cp $c $tdir &> /dev/null )
		fi
		 cd $libroot/samples
	done
	cd $libroot/datasets 
	for d in $(ls -d *) ; do 
		if [ -d "$d" ] ; then 
			cd $d && \
			(cp $c.jpg $tdir &> /dev/null  || \
			cp $c.JPG $tdir &> /dev/null || \
			cp $c.png $tdir &> /dev/null  || \
			cp $c $tdir &> /dev/null )
		fi 
		cd $libroot/datasets
	done

	cd $cdir
	}



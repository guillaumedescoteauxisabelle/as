
#@STGoal A folder where rendering are classified according to their original content.
#Used by : composite_content_result__for__by_content.sh


cdir=$(pwd)
ftag=$(basename $cdir)
echo "$cdir"
sleep 1
tdir=$cdir'_by_content'


#@STCIssue A new file with function was created
. $binroot/__cpcontentfn.sh

## @fn loopcpcontent()
## @brief Relate content source and result related
#loopcpcontent() {

#	srcfile="$1"
#	tdir="$2"
#	ftag="$3"
#	for c in $(cat "$srcfile"); do 
#		tcdir="$tdir/$c" 
#		if [ ! -d "$tcdir" ] ; then 
#			mkdir -p "$tcdir" 
#			echo -n "."
 #               fi
#
 #               cp "$c"_"$ftag"*jpg "$tcdir" &> /dev/null  && \
 #                     echo -n "."

 #       done

#}
#refreshing the local src liste
$binroot/refresh_source_list.sh
$binroot/mk_source_list.sh &

for d in $(ls -d *x); do 
	echo "Processing $d..."
	
	if [ -d "$d" ] ;then 
		
		cd "$d"
		for c in $(cat $libroot/samples/_srcfiles.txt); do 
			tcdir="$tdir/$c" 

			if [ ! -d "$tcdir" ] ; then
				mkdir -p "$tcdir"
				echo -n "."
			fi
			
			#@a Copy our content with the ftag pattern into the target names
			#@STCGoal If any, we will want the original content available in ../
			cp "$c"_"$ftag"*jpg "$tcdir" &> /dev/null  && \
				cpcontent $c $tcdir/.. && \
                                 echo -n "."

		done 

                for c in $(cat $libroot/datasets/_srcfiles.txt); do

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

#Cleanup directory we wont need
rmdir $tdir/* &> /dev/null

#@TODO Copy the original content to the target content dir

cd $tdir
#@state We have a folder called by out content name
#@state we have /a/lib samples+datasets where content are
#@states we have results in $cdir that might have been reused in rendering
echo "----$0 done---------"
echo "-- cd $tdir ---"


# source list is make that we can use for processing
cdir=$(pwd)
for d in *; do 
	
	if [ -d "$d" ] ; then 
		cd "$d" 
		for f in *.{jpg,JPG,png,PNG} ;do
			
			ff=${f%.*}
			echo $ff >> $cdir/_srcfiles.txt
		done 
		cd $cdir
	fi
done


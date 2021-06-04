
#@example 

# Run this in the directory where you have your by_content files created by _result_by_content.sh
#@Prerequisite _result_by_content.sh
composite_content_result_script=$binroot/composite_content_result.sh
#@TODO _result_by_content.sh will require Upgrade
cdir=$(pwd)
tdir=$cdir/../_montage
mkdir -p $tdir
ext=jpg
for d in * ; do 
	if  [ -d "$d" ]; then #a dir
		
		echo $d
	
		cd $d 
		for f in *.$ext ; do
			#Get out content file which _result_by_content.sh should have put in ..
			fcontentname=$(basename $(pwd))'.'$ext
			fcontentpath=$fcontentname
			$composite_content_result_script $fcontentpath $f $tdir
			
		done
		cd $cdir
	fi
done






# REF
exit


f="$1"
f2="$2"
tdir="$3"
mkdir -p $tdir


tdir=$(cd $tdir;pwd) || exit 1
mkdir -p "$tdir/L"

pointsize=42
tfont=Helvetica
bgcolor='#000000'
fillcolor='gray'

fn=${f%.*}
fn2=${f2%.*}
fl=$(echo "$fn" | sed -e 's/___/   /g' |sed -e 's/__/  /g'|sed -e 's/_/ /g');
fl2=$(echo "$fn2" | sed -e 's/___/   /g' |sed -e 's/__/  /g'|sed -e 's/_/ /g');
out=$tdir/L/$fn'__L.jpg'
out2=$tdir/L/$fn2'__L.jpg'
outm=$tdir/$fn'__M.jpg'
rx=$($binroot/imgGetResolution.sh $f x)
ry=$($binroot/imgGetResolution.sh $f y)
ry=$(expr $ry + $pointsize)
rval=$rx'x'$ry

#DEBUG=1
#$dvar f fn fl r out tdir

montage -label "$fl" -font $tfont -pointsize $pointsize -geometry +0+$pointsize -background "$bgcolor" -fill "$fillcolor" $f $out; 
montage -label "$fl2" -font $tfont -pointsize $pointsize -geometry +0+$pointsize -background "$bgcolor" -fill "$fillcolor" $f2 $out2; 
montage $out $out2  -geometry +100+0  -background "$bgcolor" -fill "$fillcolor" $outm

#feh -F $out

#@STCGoal A Montage that I love is made of the original content and the result

#@STCIssue I could not make that work - Might be nice to write where it was used and why ??
#@example cdir=$(pwd);ttdir=$cdir/_montage;mkdir -p $ttdir;for d in * ; do echo $d; cd $d; $binroot/composite_content_result.sh * $ttdir  ;cd $cdir ; done

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
outL=$tdir/L
mkdir -p $outL
out=$outL/$fn'__L.jpg'
out2L=$tdir/L
mkdir -p $out2L
out2=$out2L/$fn2'__L.jpg'
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

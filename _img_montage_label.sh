

f="$1"
export tmpdir=$(tempfile)
mkdir $tmpdir

fn=${f%.*};fl=$(sed -e 's/___/   /g'<<<$fn|sed -e 's/__/  /g'|sed -e 's/_/ /g');
out=$tmpdir/$fn'__L.jpg'
r=$($binroot/imgGetResolution.sh $f)
DEBUG=1
dvar f fn fl r out

montage -verbose -label "$fl" -font Helvetica -pointsize 54 -geometry $r -background '#000000' -fill 'gray' $f $out; 


#feh -F $out

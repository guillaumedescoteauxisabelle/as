cdir=$(pwd)
p=83
label=pierre_to_jg_st_-young-picasso-v03-201216_225m
odir=$HOME/Dropbox/Downloads__2101/7ART806
rdir=$odir/samples-vue-des-artistes-210606
tdir=$rdir'/stylized_'$p'_'$label
echo $tdir
mkdir -p $tdir
for f in *.{jpg,JPG,png};do 
	echo $f
	gia-ast $f $p
	mv *__stylize*.jpg $tdir
done
mv *__stylize*.jpg $tdir

# make the contact sheet
cd $tdir
pwd
gis-csm -d &
sleep 2
echo "Waiting a bit for the contact sheet to generate"
pwd
sleep 4

echo "@STC A build dir with thumbnails"
echo "Code and markdown and or git"
echo "Have some fun :) "

#explore the created folder
ginol "Contact sheet should be great"
x .

# View the contact sheet
cd ..
pwd
for f in *.csm.l.jpg; do x $f; done

#go back
cd $cdir


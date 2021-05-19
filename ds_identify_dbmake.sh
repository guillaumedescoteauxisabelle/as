

cdir=$(pwd)
bdir=$(basename $cdir)
#tfile=.$bdir.txt
tfile="_identities.txt"
rfile="_resolutions.txt"
rm -f $tfile &> /dev/null
rm -f $rfile &> /dev/null

shopt -s nullglob # Sets nullglob
for f in *.{jpg,jpeg,png,tif,tiff}
do
	#echo $f
	echo -n "."
	id=$(identify $f)
       #	>> $tfile
	echo $id >> $tfile

	echo "$id" | sed -e 's/JPEG/JPG/'|  awk '// { print $2" "$3"    "$1 }'  >>$rfile
	
done
shopt -u nullglob # Unsets nullglob

cat $rfile

exit
# get only res and filename and formal
#ref
#Sigvald.png PNG 1142x800 1142x800+0+0 8-bit sRGB 253KB 0.000u 0:00.000
#$FORMAT $RES $FN
rfile="_resolutions.txt"
rm -f $rfile &> /dev/null

for l in $(cat $tfile) 
do
	awk '// { print $2" "$3" "$1 }'<<<$l  >>$rfile 
done


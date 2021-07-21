m=$1
if [ "$1" == "" ] ; then 
	echo "Usage : $0 <modelname>"
else

rhn=jgi@orko #rendering host (where to sync)
thn=jgi@as #training host

rh=$(ssh $rhn "cd /a/bin;./mckinfo.sh $m")
th=$(ssh $thn "cd /a/bin;./mckinfo.sh $m")

echo $rh
echo $th
#echo "$rh" | sed -e 's/'"$th"'//g'
for t in $rh; do 
	th=$(sed -e 's/'"$t "'//g'<<< $th) 
done; echo "$th"


fi

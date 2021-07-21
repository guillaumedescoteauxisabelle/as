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

o=" "
for t in $th; do 
	echo -n "entering : $t..."
	isdone="0"
	for r in $rh ; do 
		echo -n "$r, "
		if [ "$t" == "$r" ] ; then isdone="1" ; fi

	done
	if [ "$isdone" == "1" ] ; then 
		#o+=" $t" 
		echo "$t is done"
	else
		echo "$t isn't"
		o="$o $t"
	fi
	#th=$(sed -e 's/'"$t "'//g'<<< $th) 
done; 
#echo "$th"
echo "-----------What needs to be sync -------------"
echo "$o"

fi

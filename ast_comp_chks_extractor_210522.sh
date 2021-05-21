
endpattern=x
tdir=./comp2
# Run in context of the directory where $res'x' is.
if [ "$chks_long_all"  == "" ] ;then 
	echo "Usage: $0"
	echo "VARIABLE chks_long_all must be defined"
	echo "export chks_long_all=\"15 30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300\""
else
	

	for c in $chks_long_all; do 
		echo -n "$c..." 
		for d in *$endpattern ; do  
			(cd $d; ls *$c'k'*$c'k'* 2> /dev/null \
			       	&& echo "Got something" \
			       	&& (mkdir -p $tdir/$c ;cp *$c'k'*$c'k'* $tdir/$c) \
			       	|| echo -n ".")  
			done 
		done
fi

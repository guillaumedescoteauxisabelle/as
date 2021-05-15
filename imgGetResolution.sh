
# Get size X or Y of an image

f=$1
v=$2

x=0
y=0
ratio=0

id=$(identify $f)
r=$(echo "$id" | sed -e 's/JPEG/JPG/'|  awk '// { print $3 }')
if [ "$2" != "" ]; then #we desire one side
	vv=$(echo "$r" | tr "x" " ")
	x=$(echo "$vv" | awk '// { print $1 }' )
	y=$(echo "$vv" | awk '// { print $2 }' )
	
	if [ "$v" == "x" ]; then # keep X
		r=$x
	else # Using Y
		if [ "$v" == "y" ]; then r=$y; 
		else  
			if [ "$2" == "s" ]; then #we desire both without the x
                		r="$vv"; 
			else # Ratio
				ratio=$(( 100 * $x / $y ))
				rv=$(echo "$ratio" | sed -e 's/..$/.&/;t' -e 's/.$/.0&/')
		 		if [ "$v" == "?" ] ||  [ "$v" == "e" ]; then # Check RATIO and output the largest side 
					if (( $ratio > 100 )) ; then r=x ; else  if (( $ratio < 100 )) ; then r=y; else r=e;fi;fi 
				fi
				 if [ "$v" == "r" ] ||  [ "$v" == "o" ]; then # Output ratio only
					 r=$rv
				 fi

			fi
        	fi

	fi


fi
#echo $2	
echo "$r"

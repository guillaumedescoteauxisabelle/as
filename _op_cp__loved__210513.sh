#!/bin/bash
if [ -e "$binroot/__fn.sh" ]; then 
        . "$binroot/__fn.sh" $@
fi



# v=$(mkdirns "$1" "$2" "$3")

# echo '> echo '"GIAOUTDIRNS=$v"

#echo "-------------------------"
#mkdirns "$1" "$2" "$3"

listfilepath=$libroot/pf/_ma__ast__res__210513.ls.txt
toprocess=$(cat $listfilepath)
cdir=$(pwd)
mkdirnslevel=2
stripofcharchar=("results__" "lib__" "gia-ds-")
#echo "$stripofcharchar"
a="absc"
#stripof "$1" "$@" "$stripofcharchar"
stripof "$1" "$@" "$stripofcharchar"
#exit 1
for d in $toprocess ; do 
	cd $d
	
	#t=$(echo $d  | tr "/" " "| awk // { print __ } | sed -e s/results__/ma_ast_res__/)
	# dirns=$(mkdirns "$d" "$mkdirnslevel")
	# #echo $dirns
	# t=$(stripof "$dirns" "${stripofcharchar[@]}")
	#t=$(mkdirnstrippedof "$d" "$mkdirnslevel" "${stripofcharchar[@]}")
	echo "t=\$(mkdirnstrippedof \"$d\" \"$mkdirnslevel\" \"${stripofcharchar[@]}\")"

	#echo "stripofcharchar=${stripofcharchar[@]}"
	#echo "$t"
	#(cd $d ; tar cf - $d | (mkdir $t && cd $_ && tar xvf -)
done
cd $cdir
#!/bin/bash
if [ -e "$binroot/__fn.sh" ]; then 
        . "$binroot/__fn.sh" $@
fi



v=$(make_dirns "$1" "$2" "$3")

echo '> echo '"GIAOUTDIRNS=$v"

echo "-------------------------"
make_dirns "$1" "$2" "$3"
#for d in /c/Users/jeang/Dropbox/lib/results/gia-ds-fpolsonwill_v02_210424/fp_s02-v02/_loved /c/Users/jeang/Dropbox/lib/results/frank_polson_v01_210420__210421/_loved /c/Users/jeang/Dropbox/lib/results/frank_polson_v01_210420__210423_loved_pass2 /c/Users/jeang/Dropbox/lib/results/cecinestpasunecompagnie__210420__compoStylized210420/_loved /c/Users/jeang/Dropbox/lib/results/viromunchki_segmented__210419__compoStylized/_loved /c/Users/jeang/Dropbox/lib/results/viromunchkin-s01-v01_new/_loved /c/Users/jeang/Dropbox/lib/results/daliv1-2101240443/daly__loved /c/Users/jeang/Dropbox/lib/results/Sketch__2101240002__pass02/_loved ; do t=$(echo $d  | tr "/" " "| awk // { print __ } | sed -e s/results__/ma_ast_res__/); (cd $d ; tar cf - $d | (mkdir $t && cd $_ && tar xvf -); done

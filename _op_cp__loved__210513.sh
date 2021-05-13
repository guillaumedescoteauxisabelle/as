#!/bin/bash
if [ -e "$binroot/__fn.sh" ]; then 
        . "$binroot/__fn.sh" $@
fi
#@STCGoal TODO Revise and move to common_fn
function make_dirnsMOVEDTOFN (){
	local topdir="$1"
	local levelup1="1"
	local separator="$3"
	if [ "$3" == "" ]; then separator="$GIADEFAULTFILENAMESEPARATOR"; fi #@a we have a default separator
	

	#support more levels with a second optional args
	if [ "$2" != "" ]; then 	levelup1="$2"; fi #@state we have a number of level up to do

	local cdir=$(pwd)
	
	export outdirns=$(basename $topdir)
	#echo $outdirns
	if [ "$levelup1" != "0" ]; then # so we can ask for just one level (ya know myvar=$(basename $blabla) is not so fun)
		cd $topdir  
		for i in $(seq 0 $levelup1); do
			if [ "$i" != "$levelup1" ]; then
				cd ..
				bn=$(basename $(pwd))
				outtmp="$bn$separator$outdirns"
				outdirns="$outtmp"
			fi
		done
	fi
	cd $cdir &> /dev/null #@state Back where we are
	#@a Exporting
	unset GIAOUTDIRNS
	outdirns=$(sed -e 's/\//_/' <<< $outdirns)
	# &> /dev/null)
	export GIAOUTDIRNS=$outdirns
	echo "$GIAOUTDIRNS"
	unset outdirns
}


v=$(make_dirns "$1" "$2" "$3")

echo '> echo '"GIAOUTDIRNS=$v"

#for d in /c/Users/jeang/Dropbox/lib/results/gia-ds-fpolsonwill_v02_210424/fp_s02-v02/_loved /c/Users/jeang/Dropbox/lib/results/frank_polson_v01_210420__210421/_loved /c/Users/jeang/Dropbox/lib/results/frank_polson_v01_210420__210423_loved_pass2 /c/Users/jeang/Dropbox/lib/results/cecinestpasunecompagnie__210420__compoStylized210420/_loved /c/Users/jeang/Dropbox/lib/results/viromunchki_segmented__210419__compoStylized/_loved /c/Users/jeang/Dropbox/lib/results/viromunchkin-s01-v01_new/_loved /c/Users/jeang/Dropbox/lib/results/daliv1-2101240443/daly__loved /c/Users/jeang/Dropbox/lib/results/Sketch__2101240002__pass02/_loved ; do t=$(echo $d  | tr "/" " "| awk // { print __ } | sed -e s/results__/ma_ast_res__/); (cd $d ; tar cf - $d | (mkdir $t && cd $_ && tar xvf -); done

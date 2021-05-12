#!/bin/bash

#@STCGoal Search in folder a pattern and learn where it is

#@STCGoal 

if [ -e $binroot/__fn.sh ]; then 
        source $binroot/__fn.sh $@
fi

envif $@


startapp "Search in folder a pattern and learn where it is" \
        "Guillaume Descoteaux-Isabelle" \
        2021 \
        " 
Usage greps <pattern>  [fileSuffix] [filePrefix]
        Stop and remove a container" \
        $1 #--quiet watch 

#exitifnoval "$appusage" $1
#if [ "$1" == "" ]; then
	#echo "Usage : greps <Pattern to search in> [<Prefix pattern to search from> <Suffix ...> ]
	#* greps bash_env .bash sh

	#"
	#exit
#fi

pattern="$1"
#ls $3*$2
#exit
for f in $(ls -fd $3*$2); do
	#echo $f
	pattern="$1"

	grepsearcher "$pattern" "$f"


	
	

	#cat $f | grep $1
done


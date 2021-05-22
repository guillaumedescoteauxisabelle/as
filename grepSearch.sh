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
#shift
#files=( "$@" )
#files=( "${files[@]/$pattern}" )

#ls $3*$2
#exit
#for f in $(ls -fd ${files[@]}); do

#if [ "$3" != "" ] &&  [ "$3" != "." ]; then
#       srch=$(ls -fd $2*$3) ; 
#else

#	if [ "$3" == "." ]; then
#        	srch=$(ls -fd $2*) ;
#	else
#		srch=$(ls -fd *$2)
#	fi
#fi
shopt -s nullglob # Sets nullglob
if [ "$2" == "" ]; then # we will create the array from a list
	i=0
	while read line
	do
    		files[ $i ]="$line"
    		(( i++ ))
	done < <(ls -a)

#	echo ${files[1]}
else # a filespec was given
	shift
	files=( "$@" )
	files=( "${files[@]/$pattern}" )
fi
#echo ${files[@]}


#echo "srch:$srch"
c=0
#shopt -s nullglob # Sets nullglob
for f in "${files[@]}"; do
	d echo f:$f
	

	grepsearcher "$pattern" "$f"


	
	d $c
	c=$(expr $c + 1 )	

	#cat $f | grep $1
done
shopt -u nullglob # Unsets nullglob


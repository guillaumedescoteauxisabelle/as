#!/bin/bash

#Loading functions
if [ -e $binroot/__fn.sh ]; then
                source $binroot/__fn.sh $@
fi



if [ "$1" == "--get-completions" ]; then #echo completion
	getmodellist
	exit 0
fi

if [ "$1" == "" ]; then 
	echo "Usage:   $0 <model name> [--full]"
	echo "--last --p #last model current checkpoint (used when training)"
	exit 1
fi
if [ "$1" == "--quiet" ] || [ "$2" == "--quiet" ] ||[ "$3" == "--quiet" ] ; then
	export QUIET=1
fi
export model_basename="$1"
#in case we dont have vars
if [ "$modelroot" == "" ]; then export modelroot=/a/model/models ; fi

#use of current dir as model to list
if [ "$1" == "." ]; then export model_basename="$(basename $(pwd))" ; fi


#(cd $modelroot;ls -dtr *)
if [ "$1" == "--last" ]; then
	for d in $(cd $modelroot;ls -dtr *) ; do
		#lazy way to get the last modified file hehe
		if [ -d $d ] ; then
			#echo $d
			model_basename="$d"
		fi
	done
	if [ "$QUIET" != "1" ] ; then
		echo "-----------MCKInfo Latest Model----------------------"
		echo "--"
		echo "---is : $model_basename ---"
		echo "--"
		echo "--------------------------------------------"
	fi

fi
if [ "$1" == "--modeltag" ] || [ "$1" == "--context" ]  || [ "$1" == "--c" ]  || [ "$1" == "-c" ]  || [ "$1" == "-mt" ]   ; then
	if [ "$modeltag" != "" ]; then model_basename="$modeltag" ; 
	else
		 if [ "$modelname" != "" ]; then modelname="$modeltag" ;
		 else
			echo "you must source a file that defines modeltag or modelname"
			arr=(*_env*.sh)
			#for f in $(ls *_env*.sh); do
			c=0
			echo "Possible choice in the current dir:"
			for f in ${arr[@]}; do
				echo "$c : source $f"
				c=$(expr $c + 1 )
			done
			echo "Choose which to load (number) ?"
			read choice
			v="${arr[choice]}"
			echo -n "using  $v as source.  Re-running ..."
			sleep 1
			source $v
			echo "......"
			echo "-----------------------------------------"
			$0 --context
			exit 2
		fi			
	fi
fi
if [ "$1" == "" ]; then
	#echo "Must specify model folder as argument"
	cdir="$(pwd)"
	export model_basename="$(basename $cdir)"
	export model_basename="."
	echo "using current directory as model $model_basename"
	#exit 1
fi

chkdir=checkpoint_long
if [ "$2" == "--p" ] || [ "$2" == "-p" ] ; then
	chkdir=checkpoint
fi
#if [ "$modelroot" == "" ]; then export modelroot=/a/model/models ; fi
chklist=$(cd $modelroot;cd $model_basename/$chkdir;du -a | grep data | tr "/" " " | tr "." " " | awk '// { print $3 }' |tr "-" " " | awk '// { print $2}'| sort --numeric-sort)
if [ "$2" == "--no-filter" ]; then #we dont filter
	export CHKLIST="$chklist"

else #we remove zeros
	export CHKLIST="$(echo $chklist | sed -e 's/000//g')"
fi
echo "$CHKLIST" | tr ' ' '\n' | sort -u | tr '\n' ' '

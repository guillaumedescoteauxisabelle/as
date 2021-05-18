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
export model_basename="$1"
#(cd $modelroot;ls -dtr *)
if [ "$1" == "--last" ]; then
	for d in $(cd $modelroot;ls -dtr *) ; do
		#lazy way to get the last
		model_basename="$d"
	done
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
if [ "$2" == "--p" ]; then
	chkdir=checkpoint
fi

chklist=$(cd $modelroot;cd $model_basename/$chkdir;du -a | grep data | tr "/" " " | tr "." " " | awk '// { print $3 }' |tr "-" " " | awk '// { print $2}'| sort --numeric-sort)
if [ "$2" != "" ]; then #we dont filter
	echo $chklist
else #we remove zeros
	echo $chklist | sed -e 's/000//g'
fi

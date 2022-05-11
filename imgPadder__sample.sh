#!/bin/bash
. .env &> /dev/null && . _env.sh &> /dev/null  || . .env &> /dev/null  ||  . _env.sh &> /dev/null


#@STCGoal a Sequence of file is padded with names and resolution is changed

# read the rendered sequence and pad in in a subdir s/
outdir=padded
if [ "$2" != "" ]; then outdir="$2" ; fi

padnum=5
if [ "$3" != "" ] ; then padnum="$3";fi

resout=1280
if [ "$4" != "" ] ; then resout="$4";fi

filebaseout=""
if [ "$5" != "" ] ; then filebaseout="$5";fi

ext="jpg"
if [ "$6" != "" ] ; then ext="$6";fi



fpattern="$1"
if [ "$1" == "" ]; then 
	echo "Usage: $0 <fpattern> [outdir] [padnum] [resout] [filebaseout] [ext out]"
	echo $'\n\t<fpattern> \n\t[outdir(default: padded)] \n\t[padnum(default:5)] \n\t[resout(default:1280)] \n\t[filebaseout(default: none 001.jpg...] \n\t[ext out (default:jpg)]'
	echo $'\n '"$0"$' MyFilePattern' 
	echo "$0"$' MyFilePattern _myoutputdir 2048 outPrefix'

else
	mkdir -p $outdir
	
	if [ "$echocmd" == "true" ] ; then precmd="echo ";fi

	i=0
	for f in $(ls -tr $fpattern*); do 
		i=$(($i+1))
		pad=$(printf "%0""$padnum""d\n" $i)
		$precmd convert $f -resize "$resout"x $outdir/$filebaseout$pad.$ext
	done

fi

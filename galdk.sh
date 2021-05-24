#!/bin/bash

#@STCGoal What is the final result for this
#@STCIssue What is it transcending ? What is reality, the starting point.

#Loading functions
if [ -e $binroot/__fn.sh ]; then
	        source $binroot/__fn.sh $@
fi

#galdk
#galdk.sh

################AUTOCOMPLETION
if [ "$1" == "--get-completions" ]; then #echo completion
	#ls -d */
        #getmodellist
        #getmodelcheckpoints $2
        exit 0
fi

DEBUG=0

#@TODO Set the last ARG to the one required so it will exit if its not there
## Set to: NONE 	# if no args
LASTREQUIREDARG=$2
#LASTREQUIREDARG=NONE

#Looks if we used a quiet mode :  
lookquiet $@

#########################################
#Displays the application usage and startup info
startapp "GIA Gallery Maker - Create using Docker" \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 <INPUTDIR> <OUTPUTDIR> [title] [footer] [toplevelsitename] 
        " \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################



dowork "We are creating the gallery"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)
containertag=guillaumeai/server:gal-jgi

runscript=/a/bin/gallery_html_maker2.sh
indir=$1
if [ "$1" == "." ]; then # we use current dir path
        indir=$(pwd)
fi

#inbase=$(basename $indir)

outdir=$2
if [ "$2" == "--suffix" ] || [ "$2" == "--s" ] || [ "$2" == "--gal" ]; then # We use same dir with suffix
        sufix='__gal'
        if [ "$3" != "" ]; then # we have a suffix supplied
                sufix=$3 ; fi

		outdir=$(cd $indir ; pwd)$sufix
		mkdir -p $outdir
		echo "Outdir made : $outdir"


fi

if [ -d "$indir" ] ; then
	
	#get fullpath of both in and out dir
	indir=$(cd $indir;pwd)
        mkdir -p $outdir
        outdir=$(cd $outdir;pwd)

	#Making www link to use as output pipe
	reldir=$(echo "$outdir" | sed -e 's/\/a\/lib\/results\///g')
	wwwbaseurl="http://$HOSTNAME"
	if [ "$wwwurllibresultbase" != "" ] ; then
		wwwbaseurl=$wwwurllibresultbase ; fi

	wwwurl="$wwwurllibresultbase/$reldir"
        #outbase=$(basename $outdir)

	#docker run -it --rm -v $(pwd $outdir):/output $(pwd $indir):/input $(pwd):/work $containertag $runscript /input /output
	echo docker run -it --rm -v $(pwd):/work  -v $outdir:/output -v $binroot:/a/bin -v $HOME:/home/jgi -v $indir:/input  $containertag $runscript /input /output "$3" "$4" "$5"
	sleep 1
	docker run -it --rm -v $(pwd):/work  -v $outdir:/output -v $binroot:/a/bin -v $HOME:/home/jgi -v $indir:/input  $containertag $runscript /input /output "$3" "$4" "$5" && \
		echo "$wwwurl"
else
	donework "Input dir not existent" -1
	exit -1
fi

##############END CODING HERE and define EXIT CODE somehow
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE="We are done fine"
########################################
donework "$MSG_WHEN_DONE" $EXIT_CODE 


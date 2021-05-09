#!/bin/bash

#@STCGoal Adequate Naming of Files
#@STCIssue Some sequences of bunch of files aren't n name with meaningful

if [ -e $binroot/__fn.sh ]; then
        source $binroot/__fn.sh $@
fi

DEBUG=0
d "Debug is Active"

#Loads env if one in current dir (_env.sh)
envif $@


#@TODO Set the last ARG to the one required so it will exit if its not there
LASTREQUIREDARG=$2

#Looks if we used a quiet mode :  
lookquiet $@

#########################################
#Displays the application usage and startup info
startapp "Batch Suffix Renamer Utility " \
         "Guillaume Descoteaux-Isabelle" \
          2021 \
          "
Usage $0 <SuffixToAdd> [file|filter] 
        <SuffixPattern>    Pattern to add
        [file|filter]      file or pattern (wildcard ok)
$0 \"__mysuffix\" myfile.jpg 
  #myfile__mysuffix.jpg

$0 \"__mysuffix\" \*
  # all files will be renamed

$0 \"__mysuffix\" myprefix\*.jpg
  # all files matching prefix et ext will be renamed " 
        #$LASTREQUIREDARG 
#@TODO set usage  ABOVE
################################


suf=$1
shift
dowork "Adding suffixes $suf"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)


for f in $(ls -fd $@); do 

        if [ -d "${f}" ] ; then
                d "$f is a directory, we wont do it on directory"
                sleep 1
        else
                if [ -f "${f}" ]; then #echo $f is a file

                        ft=${f%.*}
                        ext="${f##*.}" 
                        cmd="mv $f $ft$suf.$ext"  
                        echo "$cmd"
                        $cmd 
                        
				
                else
                echo "${f} is not valid";
                        # 	exit 1
                fi
        fi
done



##############END CODING HERE and define EXIT CODE somehow
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE="We are done"
########################################
donework "$MSG_WHEN_DONE" $EXIT_CODE 


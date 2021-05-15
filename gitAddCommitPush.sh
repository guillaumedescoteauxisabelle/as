#!/bin/bash

#@STCGoal What is the final result for this
#@STCIssue What is it transcending ? What is reality, the starting point.

#Loading functions
if [ -e $binroot/__fn.sh ]; then
	        source $binroot/__fn.sh $@
fi

###########DEbug
DEBUG=0
d "Debug is Active"

#Loads env if one in current dir (_env.sh)
#envif $@


#@TODO Set the last ARG to the one required so it will exit if its not there
## Set to: NONE 	# if no args
#LASTREQUIREDARG=$1
LASTREQUIREDARG=NONE

#Looks if we used a quiet mode :  
lookquiet $@

#########################################
#Displays the application usage and startup info
startapp "Git Add - Commit - Push " \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 <files ...> [Commit messagel]
        " \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################



dowork "Starting the git flow.... easy does it"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)
arr=("$@")
arrl=${#arr[@]}
last=${arr[arrl-1]}
commtype=" "  #optinal commit message opening vim etc
if [ ! -f "$last" ] && [ ! -d "$last" ]; then # We spec a commit message 
	arr=( "${arr[@]/$last}" )

	arr[$arrl-1]=" "  #removing out message from the array
	#commtype=" $last"
fi

echo "$arrl:$last"
echo "${arr[@]}"

#(ec m git add "${arr[@]}" &> /dev/null) && echo "Added" || echo "Add error" \
#	&& \
#(ec g git commit "${arr[@]}" $commtype  &> /dev/null) && echo "Committed " || echo "Commit error" && \
#	&& \
#(ec y git push &> /dev/null) && echo "Pushed " \
#       	|| ((echo "tying to pull"; git pull && git push && echo "Pulled and pushed was right") \
#       	|| ec r "might require your attention :(" )
ec r git add  "${arr[@]}"
git add  "${arr[@]}"
files="${arr[@]}"
ec b git commit  "$files -m $last"
git commit  $files -m "$last"
ec y git push
git push


##############END CODING HERE and define EXIT CODE somehow
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE=""
########################################
donework "$MSG_WHEN_DONE" $EXIT_CODE 


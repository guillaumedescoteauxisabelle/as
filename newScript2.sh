#!/bin/bash

# Create / edit / commit / push

if [ -e $binroot/__fn.sh ]; then source $binroot/__fn.sh ;else msg_warning "__fn not loaded"; fi
envif

# we will be ask for commit msg
ci_args=""
if [ "$1" == "" ]  ; then
	echo "Usage $0 <ScriptName> \"[Commit message]\"
	   if not specified, you will be asked for commit msg
	"
	exit

fi
if [ "$2" != "" ]  ; then
	ci_args=" -m  \"$2\""
fi

cdir=$(pwd)

fn="$1"
f="$1"
fp="$binroot/$f"
#echo getff "$f"
getff "$f"
#cimsg=$2


cd $binroot
if [ -e "$fn" ];then
        echo "File Already exist, Just editing.."
else
        echo "New file detected, initializing"
        cp templates/newscript.sh.txt $fn
	echo -n "Initializing $fn..."
        sleep 1
	echo "...done"
        echo "New file $fn initialized "

	#@a Ask STCGoal and Issue
	echo "-----------------STCGoal and STCIssue ----------------------------------"
	echo "---- why? Creating Tension and a small reflexion before creating this  -"
	echo "--"
	echo -n "@STCGoal "
	read stcgoalline
	echo " "
	echo -n "@STCIssue "
	read stcissueline
	echo "---------------I Got that :) ----------"
	echo "@STCGoal $stcgoalline"
	echo "@STCIssue $stcissueline"
	echo "-----------------------------------------"

	#@a Ask if Completion
	echo "----------?---------Interactivity / COMPLETION---------"
	echo -n "-- Does $fn require COMPLETION ?? (Y/N) "
	read hascompletion
	echo " "

	if [ "$(to_lower $hascompletion)" == "y" ]; then # We will setup completion
		msg_warning "Auto completion will be active for this script" 
		
		btdir=$binroot/templates
		replacer=$binroot/tools/pattern-replacer-awk.sh

		#@a Make replacement using an awk script taking an env var PATTERN, a content and a template file
		export PATTERN="STCGOALLINE"
		contenttemplate=$btdir/autocomplete_header.sh
		# tmpautocomplete_header=$TMP/autocomplete_header.sh
		# cp $contenttemplate $tmpautocomplete_header

		# sed -i 's/STCGOALLINE/'"$stcgoalline"'/g' $tmpautocomplete_header
		# sed -i 's/STCISSUELINE/'"$stcissueline"'/g' $tmpautocomplete_header

		export PATTERN="__REPLACEMENTHEAD__"
		scripttemplate=$btdir/newscript.sh.txt
		$replacer $contenttemplate $scripttemplate  > $fp \
										&& msg_success "We just created $f with the autocomplete args header" \
										|| msg_failed "replacing header in $f" 
		#@a...
		#outputvar="${inputvar//"$txt2replace"/"$txt2replacewith"}"
		echo "replacing in :$fp"
		sleep 1
		msg_info "Fixing new file REPLACEMENT"
		
	
		sedescaping "$FF" SCRIPTALIASNAME $fp  
		sedescaping "$stcgoalline" STCGOALLINE $fp 
		sedescaping "$stcissueline" STCISSUELINE $fp 
		sedescaping "$f" SCRIPTFILENAME $fp  

		msg_success "$f templatized" \
		        || msg_failed "Initializing the $ff file using template FAILED"
####################

		#an autocomplete cmd.autocomplete.txt
		tcompletefile=$binroot/etc/autocompletion/$FF.autocomplete
		if [ -f "$tcompletefile" ] ; then msg_alert "hum, we already have a complete file of that name"
			msg_warning "Skipped creating $tcompletefile"
		else
			
			autocompletetemplatefile=$binroot/templates/cmd.autocomplete.txt
			cp $autocompletetemplatefile $tcompletefile 
			
			sedescaping "$FF" SCRIPTALIASNAME $tcompletefile  
			sedescaping "$stcgoalline" STCGOALLINE $tcompletefile 
			sedescaping "$stcissueline" STCISSUELINE $tcompletefile 
			sedescaping "$f" SCRIPTFILENAME $tcompletefile  

			msg_success "$tcompletefile created"  || msg_failed "Initializing the autocomplete file using template $autocompletetemplatefile"
		
		fi
	fi
fi
#msg_status "working on"
#msg_debug "Should have created a dummy script plus its auto replace, try source its autocomplete to see if that works out"
#exit




vi $fn && chmod +x $_ && git add $_ && git commit $_  $ci_args && git push &&\
echo "$1 Created/edited and committed" ||
echo "$1 creation failed or something else was wrong"
if [ -f "$tcompletefile" ] ; then git add $tcompletefile  && git commit $_ -m "add:$fn autocomplete" && git push 
fi

#cmd.autocomplete.txt

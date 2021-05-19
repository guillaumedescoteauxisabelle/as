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
        sleep 1
        echo "New file $fn initialized "


	echo "----------?---------????---------"
	echo "-- Does $fn require COMPLETION ?? (Y/N)"
	read hascompletion
	if [ "$(to_lower $hascompletion)" == "y" ]; then # We will setup completion
		msg_warning "Auto completion will be active for this script" 
		
		btdir=$binroot/templates
		replacer=$binroot/tools/pattern-replacer-awk.sh

		#@a Make replacement using an awk script taking an env var PATTERN, a content and a template file
		export PATTERN="__REPLACEMENTHEAD__"
		contenttemplate=$btdir/autocomplete_header.sh
		scripttemplate=$btdir/newscript.sh.txt
		$replacer $contenttemplate $scripttemplate  > $fp \
										&& msg_success "We just created $f with the autocomplete args header" \
										|| msg_failed "replacing header in $f" 
		msg_info "Fixing new file REPLACEMENT"
		sed -i 's/SCRIPTALIASNAME/'"$FF"'/g' $fp  &&  sed -i 's/SCRIPTFILENAME/'"$f"'/g' $fp  && msg_success "$f templatized"  || msg_failed "Initializing the $ff file using template FAILED"
####################

		#an autocomplete cmd.autocomplete.txt
		tcompletefile=$binroot/etc/autocompletion/$FF.autocomplete
		if [ -f "$tcompletefile" ] ; then msg_alert "hum, we already have a complete file of that name"
			msg_warning "Skipped creating $tcompletefile"
		else
			
			autocompletetemplatefile=$binroot/templates/cmd.autocomplete.txt
			cp $autocompletetemplatefile $tcompletefile && sed -i 's/SCRIPTALIASNAME/'"$FF"'/g' $tcompletefile  &&  sed -i 's/SCRIPTFILENAME/'"$f"'/g' $tcompletefile  && msg_success "$tcompletefile created"  || msg_failed "Initializing the autocomplete file using template $autocompletetemplatefile"
		
		fi
	fi
fi
msg_status "working on"
msg_debug "Should have created a dummy script plus its auto replace, try source its autocomplete to see if that works out"
#exit




vi $fn && chmod +x $_ && git add $_ && git commit $_  $ci_args && git push &&\
echo "$1 Created/edited and committed" ||
echo "$1 creation failed or something else was wrong"

#cmd.autocomplete.txt

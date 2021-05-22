#!/bin/bash

#@STCGoal What is the final result for this
#@STCIssue What is it transcending ? What is reality, the starting point.

#Loading functions
if [ -e $binroot/__fn.sh ]; then
	        source $binroot/__fn.sh $@
fi

#sns-publish
#sns-publish.sh

################AUTOCOMPLETION
if [ "$3" == "--get-completions" ]; then #echo completion
        echo "@TODO List topic ARN"
      
       
        #getmodellist
        #getmodelcheckpoints $2
        exit 0
fi

###########DEbug
DEBUG=0
d "Debug is Active"

#Loads env if one in current dir (_env.sh)
#envif $@


#@TODO Set the last ARG to the one required so it will exit if its not there
## Set to: NONE 	# if no args
LASTREQUIREDARG=$2
#LASTREQUIREDARG=NONE



#########################################
#Displays the application usage and startup info
startapp "Notification CLI - AWS SNS Publish" \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 <Subject> <Message> [topicARNl]
        MORE" \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################



dowork "Sending Messages"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)
tarn=$astiaarn

if [ "$tarn" == "" ]; then echo "usage: $0 <subject> <message> [topicARN]";echo "Must specify a topic arn :  astiaarn variable is empty.  export astiaarn=myarn" ; exit 1;fi

read -r -d '' MSGCONTENT << MSG
##############################################################
#
#  $2
#
##############################################################
#
#
#
MSG

aws sns publish --topic-arn  $tarn --subject "$1" --message "$MSGCONTENT" &> /dev/null && echo "Message sent" || (echo "Failed to send" && exit 1)


##############END CODING HERE and define EXIT CODE somehow
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE=""
########################################
donework "$MSG_WHEN_DONE" $EXIT_CODE 


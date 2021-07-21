#!/bin/bash

#@STCGoal What is the final result for this
#@STCIssue What is it transcending ? What is reality, the starting point.

#Loading functions
if [ -e $binroot/__fn.sh ]; then
	        source $binroot/__fn.sh $@
fi

#sns-publish
#sns-publish.sh
#echo "$@"
################AUTOCOMPLETION
if [ "$1" == "--get-completions" ] || [ "$2" == "--get-completions" ] ||[ "$3" == "--get-completions" ]   || [ "$4" == "--get-completions" ]  || [ "$5" == "--get-completions" ] || [ "$6" == "--get-completions" ] ; then #echo completio
	dttag=$(date +'%y%m%d%H%M%S')
	#echo "------$dttag----1$1=--2$2=--3$3=--4$4=--5$5=---6$6=--"
	
        #echo "@TODO List topic ARN"
     	if [ "$3" == "" ] ; then #tell it to spec a subject
	       echo "#######ENTER_SUBJECT###### -"
	       exit
       else 
	       
	       if  [ "$4" == "" ] ; then #tell it to spec a message
	        echo "#######ENTER_MESSAGE###### -"
		exit
	       fi
	fi
	       #echo "list"	
		#echo "astia dummy6"
	#if [ "$5" == "" ] ; then
	 #      echo "Raw list"
       #else
	#       echo "non raw list-$5"
	#fi	       

	topics=$(aws sns list-topics | sed -e 's/{//g'  | sed -e 's/}//g' | sed -e 's/\[//g' | sed -e 's/\]//g' | sed -e 's/,//g' | sed -e 's/"TopicArn"://g' | sed -e 's/ //g'  | sed -e 's/"Topics"://g')
      
	for t in $topics ; do 
      		echo "\"$t\""
	done      
	#| sed -e 's/"//g' 
exit
	


       
	
	#aws sns list-topics | sed -e 's/{//g'  | sed -e 's/}//g' | sed -e 's/\[//g' | sed -e 's/\]//g' | sed -e 's/,//g' | sed -e 's/"TopicArn"://g' | sed -e 's/ //g'  | sed -e 's/"Topics"://g'
exit

	       #$binroot/galdk.sh gia-ds-daliwill-210123-v02 /www/www/datasets/gia-ds-daliwill-210123-v02 && sns-publish	       
       
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
#@a Simplified version using --simple
if [ "$3" == "--simple" ] ; then MSGCONTENT="$2" ; fi


aws sns publish --topic-arn  $tarn --subject "$1" --message "$MSGCONTENT" &> /dev/null && echo "Message sent" || (echo "Failed to send" && exit 1)


##############END CODING HERE and define EXIT CODE somehow
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE=""
########################################
donework "$MSG_WHEN_DONE" $EXIT_CODE 


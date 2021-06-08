#!/bin/bash
###############exifadd################
## 
## @STCGoal My Files are appropriatly signed and copyrighted - I have the credit I have
## @STCIssue Not sign, exiftool cli
##
## \mainpage
## \section Introduction
##   is a small Bash script that acts  ...
##  It provides...
##

## @file
## @author Guillaume Descoteaux-Isabelle <coding@guillaumeisabelle.com>
## @author Ethen Weader <Ethen.Weader@mentalos.com>
## @brief Script My Files are appropriatly signed and copyrighted - I have the credit I have - Not sign, exiftool cli
## @copyright New BSD
## @version 0.1.0
## @par URL
## https://github.com/MentalOS
## https://github.com/GuillaumeIsabelle
## @par Purpose
## ...
##

##################################
# This part you wont touch UNTILHERE
#Loading functions
if [ -e $binroot/__fn.sh ] && [ "$FNLOADED" == "" ] || [ "$FNLOADED" == "-1" ]; then # If we have access to our functions, was never loaded or we do have to reload, we load, ya !!! go on.....
   source $binroot/__fn.sh $@
fi

###############################################
##     Logging and Debugging                  #
LOG_FILE=/var/log/gia/exifadd.log; 
LOG_ENABLED=n
DEBUG=0
##############################################



#exifadd
#exifadd.sh

################AUTOCOMPLETION
if [ "$1" == "--get-completions" ]; then #echo completion
        #echo "Autocompletion_UNDEFINED"
        echo 'vi_$binroot/etc/autocompletion/exifadd.autocomplete'
        #echo "FILL_OUT_THIS_Section_in:$0:--get-completions"
        #getmodellist
        #getmodelcheckpoints $2
        exit 0
fi


###########DEbug
DEBUG=0
d "Debug is Active"

#Loads env if one in current dir (_env.sh)
envif $@


#@TODO Set the last ARG to the one required so it will exit if its not there
## Set to: NONE 	# if no args
LASTREQUIREDARG=$1
#LASTREQUIREDARG=NONE

#Looks if we used a quiet mode :  
lookquiet $@

#########################################
#Displays the application usage and startup info
startapp "exifadd - Script" \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 <arg1> <arg2> [argOptionel]
        My Files are appropriatly signed and copyrighted - I have the credit I have  \
	Not sign, exiftool cli	" \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################
exiftool -artist="Guillaume Descoteaux-Isabelle"  $1 -overwrite_original
exiftool -copyright="2021 Guillaume Descoteaux-Isabelle"  $1 -overwrite_original
exiftool -title="Collaborative Art using AI" $1 -overwrite_original
#exiftool -artist="Guillaume Descoteaux-Isabelle"


dowork "MSGWHENWEGO"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)
log_info "#@STCGoal My Files are appropriatly signed and copyrighted - I have the credit I have"
log_info "#@STCIssue Not sign, exiftool cli"
###################################
#@a##>>>>>######################################CODE HERE >>>>>

#@end##<<<<##########END CODING HERE and define EXIT CODE <<<<<<<
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE=""
########################################
donework "$MSGWHENDONE" $EXIT_CODE 


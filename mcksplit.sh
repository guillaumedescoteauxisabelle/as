#!/bin/bash

#@STCGoal What is the final result for this
#@STCIssue What is it transcending ? What is reality, the starting point.

#Loading functions
if [ -e $binroot/__fn.sh ]; then
	        source $binroot/__fn.sh $@
fi

#mcksplit
#mcksplit.sh

################AUTOCOMPLETION
if [ "$1" == "--get-completions" ]; then #echo completion
								
				if [ ! -d "checkpoint_long" ] ; then 
				exit 5
				#must be in a model folder to run this
					echo "Mush run in a root folder of a model to run this."
					echo "cd $modelroot;ls"
					exit 0
				fi
				modelname=$(basename $(pwd))
				getmodelcheckpoints $modelname

        # if [ "$2" == "" ]; then #no second args, showing models
				# 	getmodellist
				# else
				# 	modelname=$1
				# 	getmodelcheckpoints $modelname
				# fi
				# echo "good"
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
startapp "Model CheckPoint Splitter " \
	 "Guillaume Descoteaux-Isabelle" \
	  2021 \
	  "
Usage $0 <checkpoint number>  [-m (commit)]
        MORE" \
	$LASTREQUIREDARG
#@TODO set usage  ABOVE
################################



dowork "Doing it"

#Here is what it does codified
#@TODO BE CREATIVE ABOVE, ALL THE PREP IS DONE ;)
#@STate do we have a number
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
   msg_critical "error: Argument Not a number (checkpoints are numbers)" >&2; exit 1
fi


export ik=$(echo "$1" | sed -e 's/000//g') #@a Support both 15 and 15000
export d=$(pwd)-$1ik
if [ -d "$d" ] ; then #It already exist, quitting
	msg_warning "Already Exist"
	exit 3
fi


mkdir -p $d/checkpoint_long

ckpuniquepattern='_'$1'000.'
cp ./checkpoint_long/*$ckpuniquepattern* $d/checkpoint_long && \
		msg_info "Checkpoints file $1ik were copied"  || \
		(msg_failed "Copy of checkpoints files ($ckpuniquepattern)" && \
		exit 3)
 
sleep 1

# cp ./checkpoint_long/checkpoint $d/checkpoint_long

d "Editing your new checkpoint file...:"

makecheckpointfile $modelname $1

cp -f $MCHECKPOINTFILEPATH $d/checkpoint_long/checkpoint \
		&& msg_success "Created checkpoint file" \
		||( msg_failed "Creating checkpoint file" && exit 4)




if [ "$2" == "-m" ] || [ "$3" == "-m" ] ; then #Commit now an option 
	echo "Comitting model..."
	cd $d/checkpoint_long/ && git add . -f && git commit . -m "feat:$d" && git push
else
	d "Model was not comitted. (use -m next time)"
fi
cd $cdir
msg_info "$d created."



##############END CODING HERE and define EXIT CODE somehow
EXIT_CODE=0 #Define exit code
MSG_WHEN_DONE=""
########################################
donework "$MSG_WHEN_DONE" $EXIT_CODE 


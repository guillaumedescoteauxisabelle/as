#!/bin/bash


#@STCGoal  This version will be able to do it even if not in model folder and provide completion on model name and available checkpoints.
## using getmodelcheckpoints $modelname , getmodellist



# Make a unique checkpoint folder from a models with many

if [ "$1" == "--get-completions" ]; then #echo completion
        if [ "$2" == "" ]; then #no second args, showing models
					getmodellist
				else
					modelname=$1
					getmodelcheckpoints $modelname
				fi

        exit 0
fi

#Loading functions
if [ -e $binroot/__fn.sh ]; then
                source $binroot/__fn.sh $@
fi

if [ ! -d "checkpoint_long" ] ; then #must be in a model folder to run this
	msg_error "Mush run in a root folder of a model."
  echo "Usage $0 <checkpoint number>"
	exit 2
fi
if [ "$1" == "" ] ; then #must be in a model folder to run this
	msg_error "Argument missing"
  echo "Usage $0 <checkpoint number>"
	exit 2
fi
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
   msg_critical "error: Argument Not a number (checkpoints are numbers)" >&2; exit 1
fi

## tODO : run from tpour model root folder (where ./checkpoint_long is seen in the ls)
export cdir=$(pwd)
export modelname=$(basename $cdir)


export ik=$(echo "$1" | sed -e 's/000//g') #@a Support both 15 and 15000
export d=$(pwd)-$1ik
if [ -d "$d" ] ; then #It already exist, quitting
	msg_warning "Already Exist"
	exit 3
fi

####################
mkdir $d
mkdir $d/checkpoint_long

cp ./checkpoint_long/*$1* $d/checkpoint_long && echo "Checkpoints file $1ik were copied"
sleep 1
cp ./checkpoint_long/checkpoint $d/checkpoint_long

d "Editing your new checkpoint file...:"

makecheckpointfile $modelname $1

cp -f $MCHECKPOINTFILEPATH $d/checkpoint_long/checkpoint && msg_success "Created checkpoint file" || msg_failed "Creating checkpoint file"


if [ "$2" == "-m" ]; then #Commit now an option 
	echo "Comitting model..."
	cd $d/checkpoint_long/ && git add . -f && git commit . -m "feat:$d" && git push
else
	msg_info "Model was not comitted. (use -m next time)"
fi
cd $cdir
msg_info "$d created."

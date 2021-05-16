#!/bin/bash

# Make a unique checkpoint folder from a models with many

#Loading functions
if [ -e $binroot/__fn.sh ]; then
                source $binroot/__fn.sh $@
fi
if [ ! -d "checkpoint_long" ] || [ "$1" == "" ] ; then #must be in a model folder to run this
	msg_not_ok "Mush run in a root folder of a model."
  echo "Usage $0 <checkpoint number>"
	exit 2
fi
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
   msg_not_ok "error: Argument Not a number (checkpoints are numbers)" >&2; exit 1
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

echo "Editing your new checkpoint file...:"

makecheckpointfile $modelname $1

cp -f $MCHECKPOINTFILEPATH $d/checkpoint_long/checkpoint && msg_success "Created checkpoint file" || msg_failed "Creating checkpoint file"

echo "Comitting model..."

if [ "$2" == "-m" ]; then #Commit now an option 
	echo "Comitting model..."
	cd $d/checkpoint_long/ && git add . -f && git commit . -m "feat:$d" && git push
else
	msg_info "Model was not comitted. (use -m next time)"
fi
cd $cdir
msg_info "We are in this new model directory now"


#!/bin/bash

# Make a unique checkpoint folder from a models with many

## tODO : run from tpour model root folder (where ./checkpoint_long is seen in the ls)
export cdir=$(pwd)
export ik=$1
export CHECKPOINTNUM=$ik"000"
echo $CHECKPOINTNUM
export d=$(pwd)-$1ik
export modelname="$(basename $cdir)"

mkdir $d
mkdir $d/checkpoint_long


cp ./checkpoint_long/*$1* $d/checkpoint_long && echo "Checkpoints file $1ik were copied"
sleep 1

cp ../__template_checkpoint $d/checkpoint_long/checkpoint
sed -i 's/MODELNAME/'"$modelname"'/g' $d/checkpoint_long/checkpoint
sed -i 's/CHECKPOINTNUM/'"$CHECKPOINTNUM"'/g' $d/checkpoint_long/checkpoint

#cp ./checkpoint_long/checkpoint $d/checkpoint_long

echo "All should be fine :"
#echo "   replace it with :  $1000"
#sleep 2

vi $d/checkpoint_long/checkpoint

#echo "Comitting model..."
#sleep 1
#cd $d/checkpoint_long/ && git add . -f && git commit . -m "feat:$d" && git push
echo Created dir: cd $d



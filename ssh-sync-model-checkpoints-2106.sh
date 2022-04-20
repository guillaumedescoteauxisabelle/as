#!/bin/bash


#@STCGoal Sync models checkpoints from one computer to another from another
#for c in 225 240 255 270 285; do echo $c;ssh jgi@as "cd $mp;tar cf - *$c*"  | ssh jgi@orko "mkdir -p $mp;cd $mp ; tar xvf -"; done

trainersshhost=jgi@as
renderersshhost=jgi@orko
modelrootpath=/a/model/models #must be the same on both system for now

#m=model_gia-ds-Inktobers-v01-210611-864x_new
m=$1
chks="$2"
if [ "$1" == "" ] || [ "$2" == "" ]; then echo "Usage: $0 <modelfoldername> \"<checkpoints\"";exit 1;fi

mp=$modelrootpath/$m/checkpoint_long
echo "Checkpoints are : $chks"
echo "Model is : $m"

for c in $chks; do 
	ch=$c'000'

#echo 	'ssh '$trainersshhost' "cd '$mp';tar cf - *'$ch'*"  | ssh '$renderersshhost' "mkdir -p '$mp';cd '$mp' && tar xvf -"' 
	#ssh $trainersshhost '"cd '$mp';tar cf - *'$ch'*"'  | ssh $renderersshhost '"mkdir -p '$mp' && cd '$mp' && tar xvf -'"' 
	ch=$c'000'; ssh jgi@as "cd $mp;tar cf - *$ch*"  | ssh jgi@orko "mkdir -p $mp && cd $mp && tar xvf -" 
done


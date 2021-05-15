#!/bin/bash

# this copy to a Host
if [ -e $binroot/__fn.sh ]; then 
        source $binroot/__fn.sh $@
fi
envif $@


remotedir=$1
locdir=$2
if [ "$2" == "--mirror" ] || [ "$2" == "--path" ] || [ "$2" == "--p" ] ; then # We mirror the path locally
	locdir=$remotedir
fi

sshcall=jgi@orko #@a Put in the env of the user as export preferedsshcallhost=

if [ "$3" != "" ]; then # We have another host connection specified
	sshcall=$3
	d "Source Host is : $sshcall"
fi
remotecmd="'"'(cd '$remotedir';tbdir=$(basename '$remotedir');cd ..;tar cf - $tbdir )'"'"

# localcmd='(mkdir -p '$locdir';cd '$locdir' && echo "We are in and we created or made sure '$locdir' was created before we untar" && tar xf - && echo DONE LOCALLY || ( echo LOCAL FAILURE && exit 1))'
localcmd='(mkdir -p '$locdir';cd '$locdir' ;cd ..; tar xvf -)'

#ssh $sshcall 'echo $@' $locdir andmore

#ec b LOCAL:$localcmd
#ec y REMOTE:$remotecmd
#ec r "EXECUTING : "
#exit
ec r "-------------------------MSG------------"
ec b "-- For a reason I dont know, you need to copy paste the command above to run it"
ec m ">>>>"
#bash ssh $sshcall "$remotecmd" | $localcmd

echo -n ssh $sshcall 
ecn y "$remotecmd" 
ecn r '|' 
ec b $localcmd
ec m "<<<"
# cd $remotedir &&\
# 	tar cf - .|\
# 	ssh $sshcall "$remotecmd" &&\
# 	echo "Entirely DONE" ||\
# 	echo "Something when wrong in the process"


#ssh $sshcall 'x/a/bin/tarpipe.sh /a/model/models model_gia-ds-fpolsonwill_v02_210424_new/checkpoint_long' | tar xf -


#ssh $sshcall '/a/bin/tarpipe.sh /a/model/models model_gia-ds-fpolsonwill_v02_210424_new/checkpoint_long' | tar xf -


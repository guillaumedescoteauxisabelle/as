#!/bin/bash

sshcall=jgi@orko
# this copy to a Host
if [ "$1" == "" ] || [ "$2" == "" ] ; then
	echo "Usage: $0 <localdir> <targetdir> [myuser@mysshhost]"
	echo "Default sshcall is : $sshcall"
	exit 1
fi

localdir=$1
remotedir=$2


if [ "$3" != "" ]; then # We have another host connection specified
	sshcall=$3
	echo "Target Host is : $sshcall"
fi

remotecmd='mkdir -p '$remotedir';cd '$remotedir' && echo "We are in '$sshcall' and we created or made sure '$remotedir' was created" && tar xf - && echo DONE REMOTELY || ( echo REMOTE FAILED && exit 1)'

echo $remotecmd
#ssh $sshcall 'echo $@' $remotedir andmore


#exit

cd $localdir &&\
	tar cf - .|\
	ssh $sshcall "$remotecmd" &&\
	echo "Entirely DONE" ||\
	echo "Something when wrong in the process"


#ssh $sshcall 'x/a/bin/tarpipe.sh /a/model/models model_gia-ds-fpolsonwill_v02_210424_new/checkpoint_long' | tar xf -


#ssh $sshcall '/a/bin/tarpipe.sh /a/model/models model_gia-ds-fpolsonwill_v02_210424_new/checkpoint_long' | tar xf -


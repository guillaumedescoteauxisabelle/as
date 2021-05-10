#!/bin/bash

# this copy to a Host

localdir=$libroot/gia-ds-fpolsonwill_v02_210424
remotedir=$libroot/gia-ds-fpolsonwill_v02_210424
sshcall=jgi@orko

remotecmd='mkdir -p'$remotedir';cd '$remotedir' && echo "We are in" && tar xf - && echo DONE REMOTELY || echo REMOTE FAILED'
echo $remotecmd
exit
cd $localdir &&\
	tar cf - |\
	ssh $sshcall "$remotecmd" &&\
	echo "Entirely DONE" ||\
	echo "Something when wrong in the process"


#ssh $sshcall 'x/a/bin/tarpipe.sh /a/model/models model_gia-ds-fpolsonwill_v02_210424_new/checkpoint_long' | tar xf -


#ssh $sshcall '/a/bin/tarpipe.sh /a/model/models model_gia-ds-fpolsonwill_v02_210424_new/checkpoint_long' | tar xf -


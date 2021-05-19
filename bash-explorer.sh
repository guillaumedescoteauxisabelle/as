#!/bin/bash

t=$1
#tp=${t/"/"/""}
dn=$(dirname $1)
fb=$(basename $1)
if [ "$dn" != "." ]; then #we are opening a file elsewhere
	tp=$(sed -e 's/\\/\//'<<<$t)
fi
#echo tp:$tp
#echo dn:$dn
#echo bn:$fb
(cd $dn;explorer $fb)


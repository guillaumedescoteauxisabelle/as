#!/bin/bash
#Loading functions
# if [ -e $binroot/__fn.sh ]; then
#                 source $binroot/__fn.sh $@
# fi
# DEBUG=1

#going where we should work
wdir=/a/src/rwml__adaptive_style_transfer/tests
cd $wdir
ns=catter
source _env.sh $ns
mkdir -p /tmp/catter

#log_info "callurl:$callurl"
requestFileContentImage=/tmp/catter/catter.json
requestFile=/tmp/catter/iosrequest.json
responseFile=/tmp/catter/sshiphore_response.json

#cat - >>$1
# contentImage=$(cat -)

echo -n "{\"contentImage\": \"$(cat -)\"}" > $requestFileContentImage 

#echo "{\"contentImage\": \"$contentImage\"}" > $1


callurl=http://orko.guillaumeisabelle.com:90$1/stylize


export req_p1='{"x1":'$2',"x2":'$3',"x3":'$4','



echo -n "$req_p1" > $requestFile
cat $requestFileContentImage | tr "{" " " >> $requestFile
rm $requestFileContentImage


echo curl -vs --header  "$callContentType"  --request POST   --data @$requestFile  $callurl >> /var/log/gia/catter.txt 


curl -vs --header  "$callContentType"  --request POST   --data @$requestFile  $callurl | sed -e 's/data:image\/jpeg;base64,//g'

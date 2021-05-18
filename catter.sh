#!/bin/bash

echo "------------------" >> /var/log/gia/catter.txt 
ns=iosCatter
date >> /var/log/gia/catter.txt 
#Loading functions
if [ -e $binroot/__fn.sh ]; then
      source $binroot/__fn.sh $@
else
  if [ -e /a/bin/__fn.sh ]; then
      source /a/bin/__fn.sh $@
      echo "ah loaded FN another way" >> /var/log/gia/catter.txt 
    else
      echo "FAILED"
      echo "HUM, failed to load FN" >> /var/log/gia/catter.txt 
      #exit 1
    fi
fi
echo "uhhh" >> /var/log/gia/catter.txt 

LOG_ENABLED=y
LOG_FILE=/var/log/gia/catter.txt
#log_info "Starting to process input"

#going where we should work
wdir=/a/src/rwml__adaptive_style_transfer/tests
cd $wdir

source _env.sh $ns

DEBUG=1
#log_alert "Receiving data"
#log_info "$1 $2 $3 $4 $5"

callurl=http://orko.guillaumeisabelle.com:90$1/stylize

#log_info "callurl:$callurl"
requestFileContentImage=/tmp/catter/catter.json
requestFile=/tmp/catter/iosrequest.json
responseFile=/tmp/catter/sshiphore_response.json

echo "callurl:$callurl"  >> /var/log/gia/catter.txt 


# contentImage=$(cat -) && \
echo  "receiving"  >> /var/log/gia/catter.txt && \
echo -n "{\"contentImage\": \"$(cat -)\"}" > $requestFileContentImage 

echo  "received"  >> /var/log/gia/catter.txt



echo  "..."  >> /var/log/gia/catter.txt
echo  "Making request"  >> /var/log/gia/catter.txt
#@a Making the Request with desired res
export req_p1='{"x1":'$2',"x2":'$3',"x3":'$4','
echo "$req_p1"  >> /var/log/gia/catter.txt


echo -n "$req_p1" > $requestFile
cat $requestFileContentImage | tr "{" " " >> $requestFile
rm $requestFileContentImage
echo    "request file created :$requestFile" >> /var/log/gia/catter.txt

echo  "$callContentType" >> /var/log/gia/catter.txt

curl -vs --header  "$callContentType"  --request POST   --data @$requestFile  $callurl | sed -e 's/data:image\/jpeg;base64,//g'

#| cat - > $responseFile
#&& \
#echo "done" || echo "FAILED"
#ecd m "We have a request file with encoded"


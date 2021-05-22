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
savedir=/a/catter

mkdir -p $savedir

#log_info "callurl:$callurl"
mkdir -p /tmp/catter
requestFileContentImage=/tmp/catter/catter.json
requestFile=/tmp/catter/iosrequest.json
responseFile=/tmp/catter/sshiphore_response.json

#cat - >>$1
# contentImage=$(cat -)

echo -n "{\"contentImage\": \"$(cat -)\"}" > $requestFileContentImage 

#echo "{\"contentImage\": \"$contentImage\"}" > $1

modelid=$1
callurl=http://orko.guillaumeisabelle.com:90$modelid/stylize


export req_p1='{"x1":'$2',"x2":'$3',"x3":'$4','




echo -n "$req_p1" > $requestFile
cat $requestFileContentImage | tr "{" " " >> $requestFile
rm $requestFileContentImage

dttag=$(date +'%y%m%d%H%M%S')
#echo $dttag


#(cd /tmp/catter;gia-ast-response-stylizedImage2file  $requestFile "content-$dttag.jpg" contentImage) &

echo curl -vs --header  "$callContentType"  --request POST   --data @$requestFile  $callurl >> /var/log/gia/catter.txt  &


# Curl PIPE
#curl -vs --header  "$callContentType"  --request POST   --data @$requestFile  $callurl | sed -e 's/data:image\/jpeg;base64,//g'
#Curl to an output file will cat later
curl -vs --header  "$callContentType"  --request POST   --data @$requestFile  $callurl --output $responseFile --silent | sed -e 's/data:image\/jpeg;base64,//g'
#ref   --output $responseFile --silent  responseFile=
#cat $responseFile - | sed -e 's/data:image\/jpeg;base64,//g'

#@STCGoal I can know what I did : ContentFile, X1,X2,X3 and model port
#@a A json file with metadata, A content jpg image of the content
mkdir -p $savedir/db &> /dev/null
export req_db='{"x1":'$2',"x2":'$3',"x3":'$4',"modelid":"'$modelid'" }'
echo "req_db"  >  'cf_'"$dttag.json"
cd $savedir ; gia-ast-response-stylizedImage2file  $requestFile 'cf_'"$dttag.jpg" "contentImage" &> /dev/null &
sleep 1
#cp $requestFile 


#!/bin/bash
#Loading functions
if [ -e $binroot/__fn.sh ]; then
       source $binroot/__fn.sh $@
fi
LOG_ENABLED=y
LOG_FILE=/var/log/gia/catter.txt

#DEBUG=1
cdir=$(pwd)
log_debug "cdir=$cdir"

#going where we should work
wdir=/a/src/rwml__adaptive_style_transfer/tests
cd $wdir
ns=catter
source _env.sh $ns
savedir=/a/catter
log_info "-------------------------------------------"
log_status "-------Starting inferences at --$(date)----" 0

mkdir -p $savedir || (echo "Could not make savedir=$savedir " ; exit 1)

#log_info "callurl:$callurl"
mkdir -p /tmp/catter
requestFileContentImage=/tmp/catter/catter.json
requestFile=/tmp/catter/iosrequest.json
responseFile=/tmp/catter/sshiphore_response.json

#cat - >>$1
# contentImage=$(cat -)

echo -n "{\"contentImage\": \"$(cat -)\"}" > $requestFileContentImage  \
	&& log_success "content received by pipe to  $requestFileContentImage" \
       && log_info "modelid:$1"	\
	|| log_failed "content not received by pipe"

#echo "{\"contentImage\": \"$contentImage\"}" > $1

modelid=$1
callhost=localhost
#callhost=orko.guillaumeisabelle.com
callurl=http://$callhost:90$modelid/stylize


#export req_p1='{"x1":'$2',"x2":'$3',"x3":'$4','
if [ "$2" == "" ]  ; then #neither a two or three
	export req_p1='{'
	log_status "inference is neither a two or three" 1
else 
	if [ "$4" == "" ] && [ "$2" != "" ] && [ "$3" != "" ] ;then #then we have a two
		 log_status "inference is a two" 2
		export req_p1='{"x1":'$2',"x2":'$3','
	else # We have a three
		log_status "inference is a three" 3
		export req_p1='{"x1":'$2',"x2":'$3',"x3":'$4','
	fi
fi


echo -n "$req_p1" > $requestFile
cat $requestFileContentImage | tr "{" " " >> $requestFile \
	&& log_success "Partially made request with content image" \
	|| log_failed "Making partial request with content image"

rm $requestFileContentImage

dttag=$(date +'%y%m%d%H%M%S')
log_info "dttag made : $dttag"

#echo $dttag


#(cd /tmp/catter;gia-ast-response-stylizedImage2file  $requestFile "content-$dttag.jpg" contentImage) &

#echo curl -vs --header  "$callContentType"  --request POST   --data @$requestFile  $callurl >> /var/log/gia/catter.txt  &


# Curl PIPE
savebase="$savedir/cf_$dttag"
log_info "Saving base: $savebase"
saveresponsefile="$savebase.response.json"
log_info "Save response file in : $saveresponsefile"

log_status "Calling the service" 10
curl -vs --header  "$callContentType"  --request POST   --data @$requestFile  $callurl  --silent | sed -e 's/data:image\/jpeg;base64,//g' 
#curl -vs --header  "$callContentType"  --request POST   --data @$requestFile  $callurl  --silent | sed -e 's/data:image\/jpeg;base64,//g' | tee "$saveresponsefile" \
#	&& log_success "Succesfully called the service" \
#	|| log_failed "Calling the service failed"

#Curl to an output file will cat later
#curl -vs --header  "$callContentType"  --request POST   --data @$requestFile  $callurl --output $responseFile --silent | sed -e 's/data:image\/jpeg;base64,//g'
#ref   --output $responseFile --silent  responseFile=
#cat $responseFile - | sed -e 's/data:image\/jpeg;base64,//g'

#@STCGoal I can know what I did : ContentFile, X1,X2,X3 and model port
#@a A json file with metadata, A content jpg image of the content
cd $savedir

mkdir -p $savedir/db &> /dev/null
export req_db='{"x1":'$2',"x2":'$3',"x3":'$4',"modelid":"'$modelid'" }'
echo "req_db"  >  'cf_'"$dttag.json"
cd $savedir 
log_status "Decoding files in images" 15
targetcontentfile="$savebase"'__'"content.jpg"
gia-ast-response-stylizedImage2file  $requestFile "$targetcontentfile" "contentImage" &> /dev/null \
	&& log_success "Restored $targetcontentfile created" \
        || log_failed "Restored $targetcontentfile failed" &

targetstylizedfile="$savebase"'__'"stylized.jpg"
gia-ast-response-stylizedImage2file $saveresponsefile "$targetstylizedfile" \
	&& log_success "response-stylizedImage2file $targetstylizedfile created" \
	|| log_failed "response-stylizedImage2file $targetstylizedfile failed" &
sleep 1
#cp $requestFile 

cd $cdir


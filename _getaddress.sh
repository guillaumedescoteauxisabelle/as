ubase="https://astiapreviz.s3.ca-central-1.amazonaws.com"
bpath=$(echo "$1" | sed -e 's/\///g')
if [ -e "$bpath/index.html" ] ; then bpath=$(echo "$bpath"| sed -e 's/\///g')/index.html ; fi
turl="$ubase/$bpath"

echo "$turl"
#https://astiapreviz.s3.ca-central-1.amazonaws.com/dbg_v02_montage/media/large/Sketch__2101240002__01_cc01-redraw__M.jpg

if [ "$2" == "--sns" ] || [ "$3" == "--sns" ]  ; then 
	$binroot/sns-publish.sh "URL : $bpath generated" "url: $turl"$'\n'"url2:$turl/index.html" ; fi

if [ "$2" == "--open" ] || [ "$3" == "--open" ] ; 
	then 
		gixb $turl ; fi



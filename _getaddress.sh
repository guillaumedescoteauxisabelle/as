ubase="https://astiapreviz.s3.ca-central-1.amazonaws.com"
bpath=$(echo "$1")
# | sed -e 's/\///g')
if [ -e "$bpath/index.html" ] ; then bpath=$(echo "$bpath"| sed -e 's/\///g')/index.html ; fi
turl="$ubase/$bpath"

echo "$turl"
#https://astiapreviz.s3.ca-central-1.amazonaws.com/dbg_v02_montage/media/large/Sketch__2101240002__01_cc01-redraw__M.jpg

read -r -d '' HEADER << HEADERFLAG
HEADERFLAG
#   __   ___ ____ ____   __   
#  /__\ / __(_  _(_  _) /__\  
# /(__)\\__ \ )(  _)(_ /(__)\ 
#(__)(__(___/(__)(____(__)(__)
#
#HEADERFLAG


if [ "$2" == "--sns" ] || [ "$3" == "--sns" ]  ; then 
	body=$(echo $'url: \n'"$turl"$'\n\n\n' | sed -e 's/index.html\/index.html/index.html/g' | sed -e 's/jpg\/index.html/jpg/g')
	$binroot/sns-publish.sh "URL : $bpath generated" $'\n'"$HEADER"$'\n'"$body" --simple ; fi

if [ "$2" == "--open" ] || [ "$3" == "--open" ] ; 
	then 
		gixb $turl ; fi



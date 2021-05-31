
if [ ! -e "$1" ] || [ "$2" == "" ] ; then 
	echo "------------possible location-----"
	$binroot/lsastiapreviz.sh
	echo "------------------------------"
	echo "-- $0 <srcFile> <tdir> --"
	exit
fi
f="$1"
l="$2"
#l=$(echo "$2" | sed -e 's/\///' )

ssh jgi@orko "cd /home/jgi/astiapreviz/;mkdir -p $l"
scp "$f" jgi@orko:/home/jgi/astiapreviz/$l

echo "https://astiapreviz.s3.ca-central-1.amazonaws.com/$l/$f"


